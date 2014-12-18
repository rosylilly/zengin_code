require 'csv'
require 'moji'
require 'zip'
require 'open-uri'
require 'romaji'
require 'json'
require 'digest/md5'

GEM_ROOT_DIR = Pathname.new(File.expand_path(__FILE__)).join('../../..')
SOURCE_ARCHIVE_URL = 'http://ykaku.com/ginkokensaku/ginkositen.zip'

namespace :zengin do
  desc 'Download source data from ykaku.com'
  task :source do
    FileUtils.mkdir_p(GEM_ROOT_DIR.join('data'))
    puts "Download source archive from #{SOURCE_ARCHIVE_URL}"
    open(GEM_ROOT_DIR.join('data/src.zip'), 'w') do |file|
      open(SOURCE_ARCHIVE_URL) {|f| file.write f.read }
    end
    puts "Download finished"

    puts "Extract archive"
    Zip::File.open(GEM_ROOT_DIR.join('data/src.zip')) do |zip|
      zip.each do |entry|
        if entry.to_s == 'ginkositen.txt'
          open(GEM_ROOT_DIR.join('data/src.csv'), 'w') do |src|
            src.write(entry.get_input_stream.read.encode('UTF-8', 'Shift_JIS'))
          end
        end
      end
    end
    puts "Extract finished"

    FileUtils.rm(GEM_ROOT_DIR.join('data/src.zip'))
  end

  task json: [:source] do
    banks = {}
    branches = {}

    CSV.foreach(GEM_ROOT_DIR.join('data/src.csv')) do |row|
      bank_code = row[0].strip
      branch_code = row[1].strip
      kana = Moji.han_to_zen(row[2].strip)
      name = row[3].strip

      if row[4].to_i == 1 # this is a bank
        banks[bank_code] = { code: bank_code, name: name, kana: kana, hira: Moji.kata_to_hira(kana), roma: Romaji.kana2romaji(kana) }
      else # this is a branch
        branches[bank_code] ||= {}
        branches[bank_code][branch_code] = { code: branch_code, name: name, kana: kana, hira: Moji.kata_to_hira(kana), roma: Romaji.kana2romaji(kana) }
      end
    end

    open(GEM_ROOT_DIR.join('data/banks.json'), 'w') do |file|
      JSON.dump(banks, file)
    end

    branches.each_pair do |bank_code, branch_list|
      FileUtils.mkdir_p(GEM_ROOT_DIR.join('data/branches'))
      open(GEM_ROOT_DIR.join("data/branches/#{bank_code}.json"), 'w') do |file|
        JSON.dump(branch_list, file)
      end
    end
  end

  task update: [:json] do
    md5_path = GEM_ROOT_DIR.join('data/md5')

    src = File.read(GEM_ROOT_DIR.join('data/src.csv'))
    old_md5 = File.exists?(md5_path) ? File.read(md5_path).strip : ''
    now_md5 = Digest::MD5.hexdigest(src)

    if old_md5 != now_md5
      open(md5_path, 'w') { |f| f.write(now_md5) }
      open(GEM_ROOT_DIR.join('data/updated_at'), 'w') { |f| f.write(Time.now.strftime('%Y-%-m-%d')) }
    end
  end
end

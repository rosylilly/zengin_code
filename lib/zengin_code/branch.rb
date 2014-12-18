require 'zengin_code'

class ZenginCode::Branch
  def initialize(bank, code, name, kana, hira, roma)
    @bank = bank
    @code = code
    @name = name
    @kana = kana
    @roma = roma
  end
  attr_reader :bank, :code, :name, :kana, :roma
end

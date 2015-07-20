require 'zengin_code'

class ZenginCode::Bank
  @banks = {}

  class << self
    def [](code)
      @banks[code]
    end

    def []=(code, bank)
      @banks[code] = bank
    end

    def all
      @banks
    end
  end

  def initialize(code, name, kana, hira, roma)
    @code = code
    @name = name
    @kana = kana
    @hira = hira
    @roma = roma
    @branches = {}
    self.class[code] = self
  end
  attr_reader :code, :name, :kana, :hira, :roma, :branches
end

require_relative 'scanner'

module TuringTarpit
  class Tokenizer
    def initialize(source_text)
      self.scanner = Scanner.new(source_text.chars.to_a)
    end


    private

    attr_accessor :scanner
  end
end

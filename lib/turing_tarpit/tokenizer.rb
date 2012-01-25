require_relative 'scanner'

module TuringTarpit
  class Tokenizer
    def initialize(source_text)
      self.scanner = Scanner.new(source_text.chars.to_a)
    end

    def next(cell_value)
      case scanner.next_char
      when "["
        scanner.jump_forward if cell_value.zero?
        scanner.next_char
      when "]"
        if cell_value.zero?
          scanner.next_while("]") 
        else
          scanner.jump_back
          scanner.next_char
        end
      end

      scanner.current_char
    end

    attr_accessor :scanner
  end
end

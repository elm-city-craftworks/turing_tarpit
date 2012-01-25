require_relative 'scanner'

module TuringTarpit
  class Tokenizer
    def initialize(source_text)
      self.scanner = Scanner.new(source_text.chars.to_a)
    end

    def next(cell_value)
      case scanner.next_char
      when Scanner::FORWARD_JUMP
        if cell_value.zero?
          scanner.jump_forward 
        else
          scanner.next_char
        end
      when Scanner::BACKWARD_JUMP
        if cell_value.zero?
          scanner.skip_while(Scanner::BACKWARD_JUMP) 
        else
          scanner.jump_back
        end
      end

      scanner.current_char
    end

    private

    attr_accessor :scanner
  end
end

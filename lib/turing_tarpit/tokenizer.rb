require_relative 'scanner'

module TuringTarpit
  class Tokenizer
    def initialize(source_text)
      self.scanner = Scanner.new(source_text.chars.to_a)
    end

    def next(cell_value)
      scanner.validate_index

      element = scanner.current_char

      case element
      when "["
        scanner.jump_forward if cell_value.zero?

        element = scanner.next_char
      when "]"
        if cell_value.zero?
          while element == "]"
            element = scanner.next_char
            scanner.validate_index
          end
        else
          scanner.jump_back
          element = scanner.next_char
        end
      end

      scanner.next_char
      element
    end

    attr_accessor :scanner
  end
end

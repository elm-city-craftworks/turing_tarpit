module TuringTarpit
  class Interpreter
    def initialize(tokenizer, tape)
      self.tokenizer = tokenizer
      self.tape      = tape
    end

    def run
      loop do
        case tokenizer.next(tape.cell_value)
        when "+"
          tape.increment_cell_value
        when "-"
          tape.decrement_cell_value
        when ">"
          tape.increment_pointer
        when "<"
          tape.decrement_pointer
        when "."
          putc(tape.cell_value)
        when ","
          value = STDIN.getch.bytes.first
          next if value.zero?

          tape.cell_value = value
        end
      end
    end

    private

    attr_accessor :tape, :tokenizer
  end
end

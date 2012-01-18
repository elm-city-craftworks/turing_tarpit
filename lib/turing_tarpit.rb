require "io/console"

module TuringTarpit
  PointerBoundaryError = Class.new(StandardError)
  InvalidValue         = Class.new(StandardError)

  class Interpreter
    def initialize(scanner, tape)
      @scanner = scanner
      @tape    = tape
    end

    def run
      loop do
        case @scanner.next(@tape.cell_value)
        when "+"
          @tape.increment_cell_value
        when "-"
          @tape.decrement_cell_value
        when ">"
          @tape.increment_pointer
        when "<"
          @tape.decrement_pointer
        when "."
          putc(@tape.cell_value)
        when ","
          value = STDIN.getch.bytes.first
          next if value.zero?
          
          @tape.cell_value = value
        end
      end
    end
  end

  class Scanner
    def initialize(source_text)
      @chars = source_text.chars.to_a
      @index = 0
    end
    
    def next(cell_value)
      validate_index 

      element = @chars[@index]
      
      case element
      when "["
        jump_forward if cell_value.zero?

        consume
        element = @chars[@index]
      when "]"
        if cell_value.zero?
          while element == "]"
            consume
            element = @chars[@index]
            validate_index  
          end
        else
          jump_back
          consume 
          element = @chars[@index]
        end
      end
      
      consume
      element
    end
    
    private

    def validate_index
      raise StopIteration if @chars.length == @index
    end
    
    def consume
      @index += 1
    end
    
    def jump_forward
      jump("[", "]", 1)
    end
    
    def jump_back
      jump("]", "[", -1)
    end

    def jump(from, to, step)
      counter = 1
      until counter == 0
        @index += step
        case @chars[@index]
        when from
          counter += 1
        when to
          counter -= 1
        end
      end
    end
  end

  class Tape
    CELL_SIZE = 256
    
    def initialize
      @pointer_position = 0
      @cells            = []
    end
    
    attr_reader :pointer_position
    
    def cell_value
      cells[pointer_position] ||= 0
    end

    def cell_value=(value)
      raise InvalidValue unless valid_cell_value?(value)
     
      cells[pointer_position] = value
    end

    def increment_cell_value
      self.cell_value = (cell_value + 1) % CELL_SIZE
    end

    def decrement_cell_value
      self.cell_value = (cell_value - 1) % CELL_SIZE
    end
    
    def increment_pointer
      self.pointer_position = pointer_position + 1
    end

    def decrement_pointer
      raise PointerBoundaryError unless pointer_position > 0

      self.pointer_position = pointer_position - 1
    end
    
    private
    
    attr_reader :cells
    attr_writer :pointer_position

    def valid_cell_value?(value)
      value.kind_of?(Integer) && value.between?(0,CELL_SIZE-1)
    end
  end
end

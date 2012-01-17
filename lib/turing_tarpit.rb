module TuringTarpit
  PointerBoundaryError = Class.new(StandardError)
  InvalidValue         = Class.new(StandardError)

  class Scanner
    def initialize(source_text)
      @chars = source_text.chars.to_a
      @index = 0
    end
    
    def next(cell_value)
      raise StopIteration if @chars.length == @index
      element = @chars[@index]
      
      case element
      when "["
        jump_forward if cell_value.zero?

        consume
        element = @chars[@index]
      when "]"
        jump_back unless cell_value.zero?
        
        consume 
        raise StopIteration if @chars.length == @index    
        
        element = @chars[@index]
      end
      
      consume
      element
    end
    
    private
    
    def consume
      @index += 1
    end
    
    def jump_forward
      counter = 1 
      until counter == 0
        @index += 1
        case @chars[@index]
        when "["
          counter += 1
        when "]"
          counter -= 1
        end
      end
    end
    
    def jump_back
      @index -= 1 until @chars[@index] == "["
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

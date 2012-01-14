module TuringTarpit
  PointerBoundaryError = Class.new(StandardError)
  InvalidValue         = Class.new(StandardError)

  class Tape
    
    def initialize
      @pointer_position = 0
      @cells            = []
    end
    
    attr_reader :pointer_position
    
    def cell_value
      cells[pointer_position] ||= 0
    end

    def cell_value=(other)
      
    end

    def increment_cell_value
      cells[pointer_position] = cell_value + 1
    end
    
    def increment_pointer
      self.pointer_position = pointer_position + 1
    end

    def decrement_pointer
      raise PointerBoundaryError if self.pointer_position.zero?

      self.pointer_position = pointer_position - 1
    end
    
    private
    
    attr_reader :cells
    attr_writer :pointer_position
  end
end

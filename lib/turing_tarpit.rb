module TuringTarpit
  PointerBoundaryError = Class.new(StandardError)

  class Tape
    
    def initialize
      @pointer_position = 0
      @cell_value = 0
    end
    
    attr_reader :pointer_position, :cell_value

    def increment_cell_value
      self.cell_value = cell_value + 1
    end
    
    def increment_pointer
      self.pointer_position = pointer_position + 1
    end

    def decrement_pointer
      raise PointerBoundaryError if self.pointer_position.zero?

      self.pointer_position = pointer_position - 1
    end
    
    private
    
    attr_writer :pointer_position, :cell_value
  end
end

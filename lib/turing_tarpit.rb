module TuringTarpit
  class Tape
    
    def initialize
      @pointer_position = 0
    end
    
    attr_reader :pointer_position

    def cell_value
      0
    end
    
    def increment_pointer
      self.pointer_position = pointer_position + 1
    end
    
    private
    
    attr_writer :pointer_position
  end
end

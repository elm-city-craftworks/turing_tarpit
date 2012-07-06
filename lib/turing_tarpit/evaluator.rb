require "mozart"

module TuringTarpit
  class Evaluator 
    CELL_SIZE = 256

    include Mozart::Environment

    def self.run(interpreter)
      evaluator = new

      loop do
        if operation = interpreter.next_operation(evaluator.cell_value)
          evaluator.send(operation)
        end
      end
    end

    def initialize
      _(:pointer, V(:position, :position => 0))
      _(:cells, [])
    end

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

    def output_cell_value
      putc(cell_value)
    end

    def input_cell_value
      value = $stdin.getch.ord
      return if value.zero?

      self.cell_value = value
    end

    def cells
      _(:cells)
    end

    def pointer_position
      _(:pointer).position
    end

    private

    def pointer_position=(value)
      _(:pointer).position = value
    end

    def valid_cell_value?(value)
      value.kind_of?(Integer) && value.between?(0,CELL_SIZE-1)
    end
  end
end

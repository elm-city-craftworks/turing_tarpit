require "mozart"

module TuringTarpit
  class Interpreter
    include Mozart::Environment

    FORWARD_JUMP  = "["
    BACKWARD_JUMP = "]"

    OPERATIONS = { "+" => :increment_cell_value,
                   "-" => :decrement_cell_value,
                   ">" => :increment_pointer,
                   "<" => :decrement_pointer,
                   "." => :output_cell_value,
                   "," => :input_cell_value }

    def initialize(chars)
      _(:chars, chars)
      _(:index, V(:position, :position => -1))
    end

    def next_operation(cell_value)
      case next_char
      when FORWARD_JUMP
        if cell_value.zero?
          jump_forward 
        else
          skip_while(FORWARD_JUMP) 
        end
      when BACKWARD_JUMP
        if cell_value.zero?
          skip_while(BACKWARD_JUMP) 
        else
          jump_back
        end
      end

      OPERATIONS[current_char]
    end

    private

    def index
      _(:index).position
    end

    def index=(position)
      _(:index).position = position 
    end

    def chars
      _(:chars)
    end

    def current_char
      chars[index]
    end

    def next_char
      raise StopIteration if chars.length == index + 1

      self.index = index + 1
      current_char
    end

    def skip_while(char)
      next_char until current_char != char
    end

    def jump_forward
      jump(FORWARD_JUMP, BACKWARD_JUMP, 1)
      next_char
    end

    def jump_back
      jump(BACKWARD_JUMP, FORWARD_JUMP, -1)
      next_char
    end

    def jump(from, to, step)
      counter = 1
      until counter == 0
        self.index = index + step
        case chars[index]
        when from
          counter += 1
        when to
          counter -= 1
        end
      end
    end
  end
end

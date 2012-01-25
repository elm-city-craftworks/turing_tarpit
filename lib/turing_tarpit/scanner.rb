module TuringTarpit
  class Scanner
    FORWARD_JUMP  = "["
    BACKWARD_JUMP = "]"

    def initialize(chars)
      self.chars = chars
      self.index = -1
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

    private 

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
    
    attr_accessor :chars, :index
  end
end

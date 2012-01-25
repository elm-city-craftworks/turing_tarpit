module TuringTarpit
  class Scanner
    def initialize(chars)
      self.chars = chars
      self.index = 0
    end

    def current_char
      chars[index]
    end

    def next_char
      self.index = index + 1

      current_char
    end

    def jump_forward
      jump("[", "]", 1)
    end

    def jump_back
      jump("]", "[", -1)
    end

    def validate_index
      raise StopIteration if chars.length == index
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

module TuringTarpit
  class Scanner
    def initialize(chars)
      @chars = chars
      @index = 0
    end

    def current_char
      @chars[@index]
    end

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
end

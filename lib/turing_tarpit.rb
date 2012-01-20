require "io/console"

require_relative 'scanner'
require_relative 'tape'
require_relative 'tokenizer'
require_relative 'interpreter'

module TuringTarpit
  PointerBoundaryError = Class.new(StandardError)
  InvalidValue         = Class.new(StandardError)
end

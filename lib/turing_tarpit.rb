require "io/console"

require_relative 'turing_tarpit/scanner'
require_relative 'turing_tarpit/tape'
require_relative 'turing_tarpit/tokenizer'
require_relative 'turing_tarpit/interpreter'

module TuringTarpit
  PointerBoundaryError = Class.new(StandardError)
  InvalidValue         = Class.new(StandardError)
end

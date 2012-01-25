require "io/console"

require_relative 'turing_tarpit/version'
require_relative 'turing_tarpit/interpreter'
require_relative 'turing_tarpit/evaluator'

module TuringTarpit
  PointerBoundaryError = Class.new(StandardError)
  InvalidValue         = Class.new(StandardError)
end

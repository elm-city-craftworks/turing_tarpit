require 'simplecov'
SimpleCov.start

require_relative "units/interpreter_test"
require_relative "units/evaluator_test"

if ENV["TEST_ALL"]
  require_relative "integration/evaluator_test"
end

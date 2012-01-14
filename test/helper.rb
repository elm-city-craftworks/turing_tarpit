require "minitest/autorun"
require_relative "../lib/turing_tarpit"

module MiniTest
  class Spec
    alias insist lambda
  end
end

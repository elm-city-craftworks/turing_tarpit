require_relative "helper"

describe "Tape" do
  it "should initialize values to 0" do
    tape = TuringTarpit::Tape.new
    tape.cell_value.must_equal(0)
  end
end

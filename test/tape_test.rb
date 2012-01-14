require_relative "helper"

describe "Tape" do
  it "must have an initial cell value of 0" do
    tape = TuringTarpit::Tape.new
    tape.cell_value.must_equal(0)
  end

  it "must have an initial pointer position of 0" do
    tape = TuringTarpit::Tape.new
    tape.position.must_equal(0)
  end

  it "must be able to increment the pointer position" do
    tape = TuringTarpit::Tape.new

    tape.increment_pointer

    tape.position.must_equal(1)
    
    tape.increment_pointer
    tape.position.must_equal(2)
  end
end

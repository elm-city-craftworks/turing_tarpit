require_relative "helper"

describe "Tape" do
  it "must have an initial cell value of 0" do
    tape = TuringTarpit::Tape.new
    tape.cell_value.must_equal(0)
  end

  it "must be able to set the cell value at the current position" do
    tape = TuringTarpit::Tape.new

    tape.cell_value = 20

    tape.cell_value.must_equal(20)
  end

  it "must restrict cell values to integers between 0 and 255" do
    tape = TuringTarpit::Tape.new

    insist { tape.cell_value = 1.5 }.
      must_raise(TuringTarpit::InvalidValue)

    insist { tape.cell_value = -1 }.
      must_raise(TuringTarpit::InvalidValue)

    insist { tape.cell_value = 256
      must_raise(TuringTarpit::InvalidValue) }
  end

  it "must be able to increment the cell value at the current position" do
    tape = TuringTarpit::Tape.new


    tape.increment_cell_value
    tape.cell_value.must_equal(1)

    tape.increment_cell_value
    tape.cell_value.must_equal(2)
  end

  it "must be able to decrement the cell value at the current position" do
    tape = TuringTarpit::Tape.new

    5.times { tape.increment_cell_value }
    2.times { tape.decrement_cell_value }

    tape.cell_value.must_equal(3)

    tape.decrement_cell_value

    tape.cell_value.must_equal(2)
  end

  it "must have an initial pointer position of 0" do
    tape = TuringTarpit::Tape.new
    tape.pointer_position.must_equal(0)
  end

  it "must be able to increment the pointer position" do
    tape = TuringTarpit::Tape.new

    tape.increment_pointer

    tape.pointer_position.must_equal(1)
    
    tape.increment_pointer
    tape.pointer_position.must_equal(2)
  end

  it "must be able to decrement the pointer position" do
    tape = TuringTarpit::Tape.new
    3.times { tape.increment_pointer }
    tape.decrement_pointer

    tape.pointer_position.must_equal(2)
    
    tape.decrement_pointer
    tape.pointer_position.must_equal(1)
  end

  it "must raise an error if decrementing when pointer position is 0" do
    tape = TuringTarpit::Tape.new

    insist { tape.decrement_pointer }
      .must_raise(TuringTarpit::PointerBoundaryError)
  end

  it "must treat cell values independently" do
    tape = TuringTarpit::Tape.new
    tape.increment_cell_value

    tape.cell_value.must_equal(1)

    tape.increment_pointer
    tape.cell_value.must_equal(0)

    4.times { tape.increment_cell_value }
    tape.cell_value.must_equal(4)

    tape.decrement_pointer
    tape.cell_value.must_equal(1)
  end
end

require_relative "../helper"

describe "Evaluator" do
  it "must have an initial cell value of 0" do
    evaluator = TuringTarpit::Evaluator.new
    evaluator.cell_value.must_equal(0)
  end

  it "must be able to set the cell value at the current position" do
    evaluator = TuringTarpit::Evaluator.new

    evaluator.cell_value = 20

    evaluator.cell_value.must_equal(20)
  end

  it "must restrict cell values to integers between 0 and 255" do
    evaluator = TuringTarpit::Evaluator.new

    insist { evaluator.cell_value = 1.5 }.
      must_raise(TuringTarpit::InvalidValue)

    insist { evaluator.cell_value = -1 }.
      must_raise(TuringTarpit::InvalidValue)

    insist { evaluator.cell_value = 256 }.must_raise(TuringTarpit::InvalidValue) 
  end

  it "must be able to increment the cell value at the current position" do
    evaluator = TuringTarpit::Evaluator.new


    evaluator.increment_cell_value
    evaluator.cell_value.must_equal(1)

    evaluator.increment_cell_value
    evaluator.cell_value.must_equal(2)
  end

  it "must be able to decrement the cell value at the current position" do
    evaluator = TuringTarpit::Evaluator.new

    5.times { evaluator.increment_cell_value }
    2.times { evaluator.decrement_cell_value }

    evaluator.cell_value.must_equal(3)

    evaluator.decrement_cell_value

    evaluator.cell_value.must_equal(2)
  end

  it "must have an initial pointer position of 0" do
    evaluator = TuringTarpit::Evaluator.new
    evaluator.pointer_position.must_equal(0)
  end

  it "must be able to increment the pointer position" do
    evaluator = TuringTarpit::Evaluator.new

    evaluator.increment_pointer

    evaluator.pointer_position.must_equal(1)

    evaluator.increment_pointer
    evaluator.pointer_position.must_equal(2)
  end

  it "must be able to decrement the pointer position" do
    evaluator = TuringTarpit::Evaluator.new
    3.times { evaluator.increment_pointer }
    evaluator.decrement_pointer

    evaluator.pointer_position.must_equal(2)

    evaluator.decrement_pointer
    evaluator.pointer_position.must_equal(1)
  end

  it "must raise an error if decrementing when pointer position is 0" do
    evaluator = TuringTarpit::Evaluator.new

    insist { evaluator.decrement_pointer }
      .must_raise(TuringTarpit::PointerBoundaryError)
  end

  it "must treat cell values independently" do
    evaluator = TuringTarpit::Evaluator.new
    evaluator.increment_cell_value

    evaluator.cell_value.must_equal(1)

    evaluator.increment_pointer
    evaluator.cell_value.must_equal(0)

    4.times { evaluator.increment_cell_value }
    evaluator.cell_value.must_equal(4)

    evaluator.decrement_pointer
    evaluator.cell_value.must_equal(1)
  end

  it "must overflow the cell value gracefully" do

    evaluator = TuringTarpit::Evaluator.new

    evaluator.decrement_cell_value
    evaluator.cell_value.must_equal(255)

    evaluator.increment_cell_value
    evaluator.cell_value.must_equal(0)
  end
end

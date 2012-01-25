require_relative "../helper"

describe "Interpreter" do
  it "must be able to process a program with no jumps" do
    interpreter = TuringTarpit::Interpreter.new("+-<>.,")

    operations = [:increment_cell_value, 
                  :decrement_cell_value,
                  :decrement_pointer,
                  :increment_pointer,
                  :output_cell_value,
                  :input_cell_value]
      
    operations.each do |sym|
      interpreter.next_operation(0).must_equal(sym)
    end

    insist { interpreter.next_operation(0) }.must_raise(StopIteration)
  end

  it "must be able to process a program with a forward jump" do
    interpreter = TuringTarpit::Interpreter.new("[++++]-")
    interpreter.next_operation(0).must_equal(:decrement_cell_value)
    insist { interpreter.next_operation(0) }.must_raise(StopIteration)
  end

  it "must be able to process a program with a forward jump" do
    interpreter = TuringTarpit::Interpreter.new("[++++]-")
    interpreter.next_operation(0).must_equal(:decrement_cell_value)
    insist { interpreter.next_operation(0) }.must_raise(StopIteration)
  end

  it "must be able to process a program with a finite loop" do
    interpreter = TuringTarpit::Interpreter.new("++[-]")
    interpreter.next_operation(0).must_equal(:increment_cell_value)
    interpreter.next_operation(1).must_equal(:increment_cell_value)
    interpreter.next_operation(2).must_equal(:decrement_cell_value)
    interpreter.next_operation(1).must_equal(:decrement_cell_value)

    insist { interpreter.next_operation(0) }.must_raise(StopIteration)
  end

  it "must be able to process a program with an infinite (non-empty) loop" do
    interpreter = TuringTarpit::Interpreter.new("+[+]")

    interpreter.next_operation(0).must_equal(:increment_cell_value)
    (1..5).each do |i| 
      interpreter.next_operation(i).must_equal(:increment_cell_value)
    end
  end

  it "must be able to process a nested jump" do
    interpreter = TuringTarpit::Interpreter.new("[++++++[----]++].")

    interpreter.next_operation(0).must_equal(:output_cell_value)
    insist { interpreter.next_operation(0) }.must_raise(StopIteration)
  end

  it "must be able to process a nested loop" do
    interpreter = TuringTarpit::Interpreter.new("++++[-[.-],]")

    4.times { |i| interpreter.next_operation(i) }
    interpreter.next_operation(4).must_equal(:decrement_cell_value)
    interpreter.next_operation(3).must_equal(:output_cell_value)
    interpreter.next_operation(3).must_equal(:decrement_cell_value)
    interpreter.next_operation(2).must_equal(:output_cell_value)
    interpreter.next_operation(2).must_equal(:decrement_cell_value)
    interpreter.next_operation(1).must_equal(:output_cell_value)
    interpreter.next_operation(1).must_equal(:decrement_cell_value)
    interpreter.next_operation(0).must_equal(:input_cell_value)

    insist { interpreter.next_operation(0) }.must_raise(StopIteration)
  end

end

require_relative "../helper"

describe "Tokenizer" do
  it "must be able to process a program with no jumps" do
    tokenizer = TuringTarpit::Tokenizer.new("+-<>.,")

    %w[+ - < > . ,].each do |sym|
      tokenizer.next(0).must_equal(sym)
    end

    insist { tokenizer.next(0) }.must_raise(StopIteration)
  end

  it "must be able to process a program with a forward jump" do
    tokenizer = TuringTarpit::Tokenizer.new("[++++]-")
    tokenizer.next(0).must_equal("-")
    insist { tokenizer.next(0) }.must_raise(StopIteration)
  end

  it "must be able to process a program with a forward jump" do
    tokenizer = TuringTarpit::Tokenizer.new("[++++]-")
    tokenizer.next(0).must_equal("-")
    insist { tokenizer.next(0) }.must_raise(StopIteration)
  end

  it "must be able to process a program with a finite loop" do
    tokenizer = TuringTarpit::Tokenizer.new("++[-]")
    tokenizer.next(0).must_equal("+")
    tokenizer.next(1).must_equal("+")
    tokenizer.next(2).must_equal("-")
    tokenizer.next(1).must_equal("-")

    insist { tokenizer.next(0) }.must_raise(StopIteration)
  end

  it "must be able to process a program with an infinite (non-empty) loop" do
    tokenizer = TuringTarpit::Tokenizer.new("+[+]")

    tokenizer.next(0).must_equal("+")
    (1..5).each { |i| tokenizer.next(i).must_equal("+") }
  end

  it "must be able to process a nested jump" do
    tokenizer = TuringTarpit::Tokenizer.new("[++++++[----]++].")

    tokenizer.next(0).must_equal(".")
    insist { tokenizer.next(0) }.must_raise(StopIteration)
  end

  it "must be able to process a nested loop" do
    tokenizer = TuringTarpit::Tokenizer.new("++++[-[.-],]")

    4.times { |i| tokenizer.next(i) }
    tokenizer.next(4).must_equal("-")
    tokenizer.next(3).must_equal(".")
    tokenizer.next(3).must_equal("-")
    tokenizer.next(2).must_equal(".")
    tokenizer.next(2).must_equal("-")
    tokenizer.next(1).must_equal(".")
    tokenizer.next(1).must_equal("-")
    tokenizer.next(0).must_equal(",")

    insist { tokenizer.next(0) }.must_raise(StopIteration)
  end

end

require_relative "helper"

describe "Scanner" do
  it "must be able to process a program with no jumps" do
    scanner = TuringTarpit::Scanner.new("+-<>.,")

    %w[+ - < > . ,].each do |sym|   
      scanner.next(0).must_equal(sym)
    end
    
    insist { scanner.next(0) }.must_raise(StopIteration)
  end

  it "must be able to process a program with a forward jump" do
    scanner = TuringTarpit::Scanner.new("[++++]-")
    scanner.next(0).must_equal("-")
    insist { scanner.next(0) }.must_raise(StopIteration)
  end

  it "must be able to process a program with a forward jump" do
    scanner = TuringTarpit::Scanner.new("[++++]-")
    scanner.next(0).must_equal("-")
    insist { scanner.next(0) }.must_raise(StopIteration)
  end

  it "must be able to process a program with a finite loop" do
    scanner = TuringTarpit::Scanner.new("++[-]")
    scanner.next(0).must_equal("+")
    scanner.next(1).must_equal("+")
    scanner.next(2).must_equal("-")
    scanner.next(1).must_equal("-")

    insist { scanner.next(0) }.must_raise(StopIteration)
  end

  it "must be able to process a program with an infinite (non-empty) loop" do
    scanner = TuringTarpit::Scanner.new("+[+]")

    scanner.next(0).must_equal("+")
    (1..5).each { |i| scanner.next(i).must_equal("+") }
  end

  it "must be able to process a nested jump" do
    scanner = TuringTarpit::Scanner.new("[++++++[----]++].")

    scanner.next(0).must_equal(".")
    insist { scanner.next(0) }.must_raise(StopIteration)
  end

end

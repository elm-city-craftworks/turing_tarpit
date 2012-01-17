require_relative "helper"

describe "Scanner" do
  it "must be able to process a program with no jumps" do
    scanner = TuringTarpit::Scanner.new("+-<>.,")

    %w[+ - < > . ,].each do |sym|   
      scanner.next(true).must_equal(sym)
    end
    
    insist { scanner.next(true) }.must_raise(StopIteration)
  end

  it "must be able to process a program with a forward jump" do
    scanner = TuringTarpit::Scanner.new("[++++]-")
    scanner.next(true).must_equal("-")
    insist { scanner.next(true) }.must_raise(StopIteration)
  end

  it "must be able to process a program with a forward jump" do
    scanner = TuringTarpit::Scanner.new("[++++]-")
    scanner.next(true).must_equal("-")
    insist { scanner.next(true) }.must_raise(StopIteration)
  end

  it "must be able to process a program with a finite loop" do
    scanner = TuringTarpit::Scanner.new("++[-]")
    scanner.next(true).must_equal("+")
    scanner.next(false).must_equal("+")
    scanner.next(false).must_equal("-")
    scanner.next(false).must_equal("-")

    insist { scanner.next(true) }.must_raise(StopIteration)
  end

end

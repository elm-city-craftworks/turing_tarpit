require_relative "helper"

describe "Scanner" do
  it "must be able to process a program with no jumps" do
    scanner = TuringTarpit::Scanner.new("+-<>.,")

    %w[+ - < > . ,].each do |sym|   
      scanner.next(false).must_equal(sym)
    end
  end

end

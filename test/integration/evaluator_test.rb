require "stringio"
require_relative "../helper"

describe "Evaluator" do
  before do
    $stdin = StringIO.new

    def $stdin.getch
      getc
    end
  end

  it "must successfully run hello_world.bf" do
    insist { bf_eval("hello.bf") }.must_output("Hello World!\n")
  end

  it "must successfully run rot13.bf" do
    provide_input("Uryyb Jbeyq!\n\0")
    insist { bf_eval("rot13.bf") }.must_output("Hello World!\n")
  end

  after do
    $stdin = STDIN
  end

  def provide_input(text)
    $stdin << text
    $stdin.rewind
  end

  def bf_eval(filename)
    src_file    = "#{File.dirname(__FILE__)}/../fixtures/#{filename}"
    interpreter = TuringTarpit::Interpreter.new(File.read(src_file))
    TuringTarpit::Evaluator.run(interpreter)
  end
end

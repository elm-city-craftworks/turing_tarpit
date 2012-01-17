require_relative "lib/turing_tarpit"

tape    = TuringTarpit::Tape.new
scanner = TuringTarpit::Scanner.new(ARGF.read)

interpreter = TuringTarpit::Interpreter.new(scanner, tape)

interpreter.run

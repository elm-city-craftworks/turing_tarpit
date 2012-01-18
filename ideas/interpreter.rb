require_relative "lib/turing_tarpit"

tape    = TuringTarpit::Tape.new
tokenizer = TuringTarpit::Tokenizer.new(ARGF.read)

interpreter = TuringTarpit::Interpreter.new(tokenizer, tape)

interpreter.run

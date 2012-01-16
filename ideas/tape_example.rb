tape = TuringTarpit::Tape.new

tape.cell_value #=> 0
tape.cell_value = 100 #=> 100
tape.increment_cell_value #=> 101
tape.decrement_cell_value #=> 100
tape.increment_pointer
tape.decrement_pointer

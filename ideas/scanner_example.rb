# a jump
scanner = Scanner.new("[++]-")
scanner.next_token(0) #=> "-"


# an infinite loop
scanner = Scanner.new("+[++]-")
scanner.next_token(0) #=> "+"
scanner.next_token(1) #=> "+"
scanner.next_token(2) #=> "+"
scanner.next_token(3) #=> "+"

# a finite loop

scanner = Scanner.new("++[-]+")

scanner.next_token(true) #=> "+"
scanner.next_token(false) #=> "+"
scanner.next_token(false) #=> "-"
scanner.next_token(false) #=> "-"
scanner.next_token(true) #=> "+"

# ^ could a boolean work?

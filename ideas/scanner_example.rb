# a jump
tokenizer = Tokenizer.new("[++]-")
tokenizer.next_token(0) #=> "-"


# an infinite loop
tokenizer = Tokenizer.new("+[++]-")
tokenizer.next_token(0) #=> "+"
tokenizer.next_token(1) #=> "+"
tokenizer.next_token(2) #=> "+"
tokenizer.next_token(3) #=> "+"

# a finite loop

tokenizer = Tokenizer.new("++[-]+")

tokenizer.next_token(true) #=> "+"
tokenizer.next_token(false) #=> "+"
tokenizer.next_token(false) #=> "-"
tokenizer.next_token(false) #=> "-"
tokenizer.next_token(true) #=> "+"

# ^ could a boolean work?

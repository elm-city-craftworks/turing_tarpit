# Turing Tarpit, A Brainfuck Interpreter

This was built as a demo application for Practicing Ruby Issue 3.3. You can
subscribe to the journal at: http://practicingruby.com

## Using Turing Tarpit

You need Ruby 1.9.3 to make this project work. It might be possible to get the
code running using 1.9.2 + the io-console gem, but that's completely untested
currently.

Turing Tarpit can be installed as a gem via rubygems.org, but if you're thinking
about hacking on it, the easiest way to try it out is to run the "Hello World"
program included in this repository:

    $ ruby bin/turing_tarpit test/fixtures/hello.bf

There is also a Rot13 example (test/fixtures/rot13.bf), but be warned: You 
need to know how to enter null characters to be able to cleanly exit it. 
In OS X terminal, this can be done by pressing Ctrl+Shift+2.

Both examples are based on the code in the 
[Brainfuck Wikipedia article](http://en.wikipedia.org/wiki/Brainfuck).

## Running the tests

Before sending pull requests, please make sure all tests pass.

    $ bundle
    $ ruby test/suite.rb

## License

Copyright (c) 2011 Gregory Brown 

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE

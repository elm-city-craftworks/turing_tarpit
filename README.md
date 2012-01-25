# Turing Tarpit, A Brainfuck Interpreter

This was built as a demo application for Practicing Ruby Issue 3.3. You can
subscribe to the journal at: http://practicingruby.com

## Using Turing Tarpit

You need Ruby 1.9.3 to make this project work. It might be possible to get the
code running using 1.9.2 + the io-console gem, but that's completely untested
currently.

Turing Tarpit can be installed as a gem via rubygems.org, but if you're thinking
about hacking on it, the easiest way to try it out is:

   $ bundle
   $ bundle exec turing_tarpit test/fixtures/hello.bf

## To run the tests:

    $ bundle
    $ ruby test/suite.rb

require "#{File.dirname(__FILE__)}/lib/turing_tarpit/version"

Gem::Specification.new do |s|
  s.name = "turing_tarpit"
  s.version = TuringTarpit::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Gregory Brown"]
  s.email = ["gregory.t.brown@gmail.com"]
  s.homepage = "http://github.com/elm-city-craftworks/turing_tarpit"
  s.summary = "A brainfuck interpreter"
  s.description = "A brainfuck interpreter"
  s.files = Dir.glob("{bin,lib,test}/**/*") + 
    %w(README.md CHANGELOG)
  s.require_path = 'lib'
  s.executables = ["turing_tarpit"]

  s.add_development_dependency "simplecov"

  s.required_ruby_version = ">= 1.9.3"
  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project = "turing_tarpit"
end

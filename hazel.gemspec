lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'hazel/version'

Gem::Specification.new do |s|
  s.name        = "hazel"
  s.version     = Hazel::VERSION::STRING
  s.summary     = "A simple Sinatra app generator."
  s.description = "Hazel is a generator for Sinatra apps, heavily based on snfn"
  s.email       = "peter@c7.se"
  s.homepage    = "http://c7.github.com/hazel/"
  s.authors     = ["Peter Hellberg"]
  s.licenses    = "MIT-LICENSE"

  s.executables = ['hazel']
  s.default_executable = 'hazel'

  s.require_paths = [%q{lib}]

  s.files = Dir.glob("lib/**/*") +
    [
      "lib/templates/public/images/.gitkeep",
      "lib/templates/public/javascripts/.gitkeep"
    ] +
    Dir.glob("spec/**/*") +
    %w(Gemfile Gemfile.lock MIT-LICENSE README.md Rakefile)

  s.add_runtime_dependency('thor', '~> 0.18')
  s.add_development_dependency('bundler', '~> 1.5.1')
  s.add_development_dependency('minitest', '~> 5.2')
end

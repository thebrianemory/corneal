lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'corneal/version'

Gem::Specification.new do |spec|
  spec.name        = "corneal"
  spec.version     = Corneal::VERSION::STRING
  spec.summary     = "A Sinatra app generator."
  spec.description = "Corneal is a Sinatra app generator with Rails-like simplicity."
  spec.email       = "the@brianemory.com"
  spec.homepage    = "http://thebrianemory.github.io/corneal/"
  spec.authors     = ["Brian Emory"]
  spec.licenses    = "MIT"

  spec.executables = ['corneal']

  spec.require_paths = [%q{lib}]

  spec.files = Dir.glob("lib/**/*") +
    [
      "lib/corneal/generators/app/templates/app/models/.gitkeep",
      "lib/corneal/generators/app/templates/public/images/.gitkeep",
      "lib/corneal/generators/app/templates/public/javascripts/.gitkeep"
    ] +
    Dir.glob("spec/**/*") +
    %w(Gemfile Gemfile.lock LICENSE README.md Rakefile)

  spec.add_runtime_dependency('thor', '~> 0.18')
  spec.add_runtime_dependency('activesupport', '~> 5.0')
  spec.add_development_dependency('bundler', '~> 1.5', '>= 1.5.1')
  spec.add_development_dependency('minitest', '~> 5.2')
end

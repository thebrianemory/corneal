# encoding: utf-8

require "rake/testtask"
require "bundler/gem_tasks"
require "pry"

Rake::TestTask.new(:spec) do |test|
  test.libs << 'lib' << 'spec'
  test.pattern = 'spec/**/*_spec.rb'
end

task :default => :spec

task :console do
  Pry.start
end

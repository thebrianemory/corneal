# encoding: utf-8

require "rake/testtask"
require "bundler/gem_tasks"

Rake::TestTask.new(:spec) do |test|
  test.libs << 'lib' << 'spec'
  test.pattern = 'spec/**/*_spec.rb'
end

task :default => :spec

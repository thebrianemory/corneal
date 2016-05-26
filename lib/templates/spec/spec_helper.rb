# encoding: UTF-8

require 'bundler'

Bundler.setup
Bundler.require

ENV["RACK_ENV"] = "test"

require 'minitest/pride'
require 'minitest/autorun'
require 'minitest/spec'
require 'rack/test'
<% if @redis %>
require 'fakeredis'
REDIS = Redis.new
<% end %>

require "find"
%w{./config/initializers ./lib}.each do |load_path|
  Find.find(load_path) { |f| require f if f.match(/\.rb$/) }
end

class MiniTest::Spec
  include Rack::Test::Methods
end

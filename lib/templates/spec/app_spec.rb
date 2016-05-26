require_relative "spec_helper"
require_relative "../<%= @name %>.rb"

def app
  <%= @name.camel_case %>
end

describe <%= @name.camel_case %> do
  it "responds with a welcome message" do
    get '/'

    last_response.body.must_include 'Welcome to the Sinatra Template!'
  end
end

class <%= @name.camel_case %> < Sinatra::Base

  set :public_folder => "public", :static => true

  get "/" do
    erb :welcome
  end
end

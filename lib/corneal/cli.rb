require "thor"

module Corneal
  class CLI < Thor

    desc "-v", "Show Corneal version number"
    map %w[-v --version] => :version
    # USAGE: corneal -v
    def version
      say "Corneal #{Corneal::VERSION::STRING}"
    end


    # register(class_name, subcommand_alias, usage_list_string, description_string)
    register Corneal::Generators::AppGenerator, "new", "new APP_PATH", "Creates a new Sinatra application"
    register Corneal::Generators::ModelGenerator, "model", "model NAME", "Generate a model"
    register Corneal::Generators::ControllerGenerator, "controller", "controller NAME", "Generate a controller"
    register Corneal::Generators::ScaffoldGenerator, "scaffold", "scaffold NAME", "Generate a model with its associated views and controllers"

    def self.exit_on_failure
      true
    end
  end
end

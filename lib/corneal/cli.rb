require "thor"

module Corneal
  class CLI < Thor

    desc "--version", "Dispaly Corneal version"
    map %w[-v --version] => :version
    # USAGE: corneal -v
    def version
      say "Corneal #{Corneal::VERSION::STRING}"
    end


    # register(class_name, subcommand_alias, usage_list_string, description_string)
    register Corneal::Generators::AppGenerator, "new", "new", "Creates a new Sinatra application"
    # register Corneal::Generators::ModelGenerator, "model", "model", "Generates a model"

    def self.exit_on_failure
      true
    end
  end
end

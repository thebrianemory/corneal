require "thor/group"
require 'active_support/inflector'

module Corneal
  module Generators
    class ScaffoldGenerator < Thor::Group
      include Thor::Actions
      attr_reader :file_name, :class_name, :controller_class_name, :model_name, :migration_name, :migration_class_name, :table_name

      desc "Generate an ActiveRecord model with it's associated views and controllers"
      argument :name, :type => :string, :desc => "Name of the model"
      argument :attributes, type: :array, default: [], banner: "field:type field:type"

      class_option :migration, type: :boolean, default: true, desc: "Generate migration for model"

      def self.source_root
        File.dirname(__FILE__)
      end

      def setup
        @model_name            = name.singularize
        @class_name            = model_name.camel_case
        @controller_class_name = "#{@class_name.pluralize}Controller"
        @file_name             = model_name.file_name
        @table_name            = @file_name.pluralize
        @migration_name        = "create_#{@table_name}"
        @migration_class_name  = @migration_name.camel_case
      end

      def create_model
        ModelGenerator.new([name, attributes]).invoke_all
      end

      def create_views
        directory "templates/views", File.join("app/views", "#{table_name}")
      end

      def create_controller
        template "templates/controller.rb.erb", File.join("app/controllers", "#{file_name}_controller.rb")
        insert_into_file "config.ru", "use #{controller_class_name}\n", :after => "run ApplicationController\n"
      end

    end
  end
end

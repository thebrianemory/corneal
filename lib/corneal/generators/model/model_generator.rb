require "thor/group"
require "active_support/inflector"

module Corneal
  module Generators
    class ModelGenerator < Thor::Group
      include Thor::Actions
      attr_reader :file_name, :class_name, :model_name, :migration_name, :migration_class_name, :table_name

      desc "Generate an ActiveRecord model"
      argument :name, type: :string, desc: "Name of the model"
      argument :attributes, type: :array, default: [], banner: "field:type field:type"

      # --no-migration make migrations optional
      class_option :migration, type: :boolean, default: true, desc: "Generate migration for model"

      def self.source_root
        File.dirname(__FILE__)
      end

      def setup
        @model_name           = name.singularize
        @class_name           = model_name.camel_case
        @file_name            = model_name.underscore
        @table_name           = file_name.pluralize
        @migration_name       = "create_#{table_name}"
        @migration_class_name = migration_name.camel_case

        attributes.map! do |attribute|
          field = attribute.split(":")
          { name: field[0], type: field[1] || "string" }
        end
      end

      def create_model
        unless model_name == name
          say "[WARNING] The model name '#{name}' was recognized as a plural, using the singular '#{model_name}' instead."
        end

        template "model.rb.erb", File.join("app/models", "#{file_name}.rb")
      end

      def create_migration
        return unless options[:migration]

        migration_files = Dir.entries("db/migrate").select { |path| !File.directory? path }

        if duplicate = migration_files.find { |file| file.include?(migration_name) }
          say_status :identical, "db/migrate/#{duplicate}", :blue
        else
          version = Time.now.utc.strftime("%Y%m%d%H%M%S")
          migration_file_name = "#{version}_#{migration_name}.rb"

          template "migration.rb.erb", File.join("db/migrate", migration_file_name)
        end
      end
    end
  end
end

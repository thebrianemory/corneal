require "thor/group"

module Corneal
  module Generators
    class ModelGenerator < Thor::Group
      include Thor::Actions

      desc "Generate an ActiveRecord model"
      argument :name, :type => :string, :desc => "Name of the model"
      # argument :attributes, type: :array, default: []

      def self.source_root
        File.dirname(__FILE__)
      end

      def setup
        @class_name = name.camel_case
        @file_name = name.file_name
      end

      def create_model
        template 'model.rb.erb', File.join('app/models', "#{@file_name}.rb")
      end

      # def create_migration
      # end
    end
  end
end

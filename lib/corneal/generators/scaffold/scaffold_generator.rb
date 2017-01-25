require "thor/group"
require 'active_support/inflector'

module Corneal
  module Generators
    class ScaffoldGenerator < Thor::Group
      include Thor::Actions

      desc "Generate an ActiveRecord model with it's associated views and controllers"
      argument :name, type: :string, desc: "Name of the model"
      argument :attributes, type: :array, default: [], banner: "field:type field:type"

      def create_model
        ModelGenerator.new([name, attributes]).invoke_all
      end

      def create_controller
        ControllerGenerator.new([name]).invoke_all
      end
    end
  end
end

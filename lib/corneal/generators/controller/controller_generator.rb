require "thor/group"
require "active_support/inflector"

module Corneal
  module Generators
    class ControllerGenerator < Thor::Group
      include Thor::Actions
      attr_reader :controller_name, :class_name, :file_name

      desc "Generate an Controller with associated views"
      argument :name, type: :string, desc: "Name of the controller"

      # --no-views make views optional
      class_option :views, type: :boolean, default: true, desc: "Generate views for controller"

      def self.source_root
        File.dirname(__FILE__)
      end

      def setup
        @controller_name = name.pluralize.underscore
        @class_name      = "#{controller_name.camel_case}Controller"
        @file_name       = class_name.underscore
      end

      def create_controller
        template "templates/controller.rb.erb", File.join("app/controllers", "#{file_name}.rb")
        insert_into_file "config.ru", "use #{class_name}\n", after: "run ApplicationController\n"
      end

      def create_views
        return unless options[:views]
        directory "templates/views", File.join("app/views", "#{controller_name}")
      end
    end
  end
end

# encoding: UTF-8
require "thor/group"

module Corneal
  module Generators
    class AppGenerator < Thor::Group
      include Thor::Actions

      desc "Creates a new Sinatra application"
      argument :name, :type => :string, :desc => "The name of the new application"
      class_option :capistrano, :type => :boolean, :desc => "Include Capistrano configuration"
      class_option :database, :aliases => "-d", :default => "", :desc => "The type of database to use"
      class_option :redis, :type => :boolean, :desc => "Include Redis configuration"
      class_option :rvm, :type => :boolean, :desc => "Create .ruby-version (ruby-2.1.0) and .ruby-gemset"
      class_option :bundle, :type => :boolean, :desc => "Run bundle after generating the app"
      class_option :git, :type => :boolean, :desc => "Initialize a Git repository"

      # Creates instance variables from options passed to corneal.
      def setup
        @app_path = name.directory_name
        @name     = name.file_name

        options.each do |key, value|
          instance_variable_set "@#{key.to_s}".to_sym, value
        end
      end

      def self.source_root
        File.expand_path(File.join(File.dirname(__FILE__), "templates"))
      end

      # Create empty directories
      def create_empty_directories
        %w{config/initializers lib spec}.each do |dir|
          empty_directory File.join(@app_path, dir)
        end

        empty_directory File.join(@app_path, 'db/migrate')

        create_file File.join(@app_path, "lib", ".gitkeep")
        template "config/environment.rb", File.join(@app_path, "config/environment.rb")
      end

      def create_public_directory
        %w{public/stylesheets public/javascripts public/images}.each do |dir|
          directory dir, File.join(@app_path, dir)
        end

        template "public/favicon.ico", File.join(@app_path, "public/favicon.ico")
      end

      def create_app_directory
        %w{app/controllers app/views app/models}.each do |dir|
          directory dir, File.join(@app_path, dir)
        end
      end

      def create_app_spec
        template "spec/application_controller_spec.rb", File.join(@app_path, "spec/application_controller_spec.rb")
      end

      def create_spec_helper
        template "spec/spec_helper.rb", File.join(@app_path, "spec/spec_helper.rb")
      end

      def create_config
        template "config.ru", File.join(@app_path, "config.ru")
      end

      def create_gemfile
        template "Gemfile", File.join(@app_path, "Gemfile")
      end

      def create_rakefile
        template "Rakefile", File.join(@app_path, "Rakefile")
      end

      def create_readme
        copy_file "README.md", File.join(@app_path, "README.md")
      end

      def create_db_config
        template("config/db.yml", File.join(@app_path, "config/db.yml")) unless @database.empty?
      end

      def create_database_initializer
        template("config/initializers/database.rb", File.join(@app_path, "config/initializers/database.rb")) unless @database.empty?
      end

      def create_redis_config
        copy_file("config/redis.yml", File.join(@app_path, "config/redis.yml")) if @redis
      end

      def create_redis_initializer
        template("config/initializers/redis.rb", File.join(@app_path, "config/initializers/redis.rb")) if @redis
      end

      def create_capistrano_config
        if @capistrano
          inside(@app_path) do
            run('cap install')
          end
        end
      end

      def create_rvm_gemset
        if @rvm
          create_file(File.join(@app_path, '.ruby-version'), 'ruby-2.1.0')
          create_file(File.join(@app_path, '.ruby-gemset'), @app_path)

          @bundle = false
          puts "You need to run 'bundle install' manually."
        end
      end

      def initialize_git_repo
        inside(@app_path) do
          run('git init .') if @git
        end
      end

      def install_dependencies
        inside(@app_path) do
          run('bundle') if @bundle
        end
      end
    end
  end
end

<% unless @database.empty? -%>
require "yaml"
settings = YAML::load_file("config/db.yml")
<% if @database != 'mongo' -%>
# Sequel Configuration
require "sequel"
 DB = Sequel.connect(settings[ENV['RACK_ENV']])
<% else -%>
# MongoDB Configuration
<% end -%>
<% end -%>

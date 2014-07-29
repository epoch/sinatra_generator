require 'thor/group'

module SinatraGenerator
  class Generator < Thor::Group
    include Thor::Actions

    desc "Generate a basic hello world application"

    argument :folder_name, :type => :string

    class_option :modular, aliases: "-m", desc: "modular style. Inherits from Sinatra::Base"
    class_option :views, aliases: "-v", desc: "include views folder, index.erb and layout.erb"
    class_option :assets, aliases: "-a", desc: "include public, javascripts and stylesheets folder" 
    class_option :procfile, aliases: "-p", desc: "include Procfile" 

    def self.source_root
      File.dirname(__FILE__)
    end

    def create_root
      empty_directory folder_name
      #FileUtils.cd destination_root
    end

    def main_rb
      template "#{Generator.source_root}/templates/main.rb", "#{folder_name}/main.rb"
    end

    def gemfile
      template "#{Generator.source_root}/templates/Gemfile", "#{folder_name}/Gemfile"
    end

    def config_ru
      template "#{Generator.source_root}/templates/config.ru", "#{folder_name}/config.ru"
    end

    def procfile
      template "#{Generator.source_root}/templates/Procfile", "#{folder_name}/Procfile" if options[:procfile]
    end

    def views
      if options[:views]
        inside folder_name do

          empty_directory 'views'

          inside 'views' do
            copy_file "#{Generator.source_root}/templates/layout.erb", "layout.erb"
            copy_file "#{Generator.source_root}/templates/index.erb", "index.erb"     
          end
        end
      end
    end

    def public
      if options[:assets] 
        directory "#{Generator.source_root}/templates/public", "#{folder_name}/public"

        if options[:views]
          insert_into_file "#{folder_name}/views/layout.erb", "\n  <link rel='stylesheet' href='/stylesheets/main.css'>",
            :after => '<title>Hello World</title>'
        end
      end
    end

  end
end

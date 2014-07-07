require_relative "sinatra_generator/version"
require_relative "sinatra_generator/generator"
require_relative "sinatra_generator/cli"

#require 'fileutils'

module SinatraGenerator
end


# MAIN_RB = %{require 'sinatra'

# get '/' do
#   'hello world'
# end
# }

# MAIN_RB_MODULAR = %{require 'sinatra/base'      

# class HelloWorld < Sinatra::Base

#   get '/' do
#     'hello world'
#   end

# end
# }


# LAYOUT_ERB = %{<!doctype html>
# <html lang="en">
# <head>
#   <meta charset="UTF-8">
#   <title>Hello World</title>
# </head>
# <body>

#   <%= yield %>

# </body>  
# }

# INDEX_ERB = %{<h1>hello world</h1>
# }

# CONFIG_RU_MODULAR = %{require 'bundler'
# Bundler.require

# require './main'
# run HelloWorld
# }

# CONFIG_RU = %{require './main'
# run Sinatra::Application
# }

# GEMFILE = %{source "https://rubygems.org"

# gem 'sinatra'
# }

# PROCFILE = %{web: bundle exec rackup config.ru -p $PORT
# }

#     HOME_RC_FILE = "~/.sinatra_generator.json"

#     def initialize(folder_name)
#       @folder_name = folder_name
#       config = load_config
#       @css_dir = config['css_dir'] || 'stylesheets'
#       @js_dir = config['js_dir'] || 'javascripts'
#     end

#     def load_config
#       config = JSON File.read(File.expand_path(HOME_RC_FILE))
#     rescue
#       config = {}
#     end

#     def generate(options = {})

#       begin
#         FileUtils.mkdir folder_name
#       rescue StandardError => e
#         return "Error: #{e.message}"
#       end

#       FileUtils.chdir folder_name do

#         if options[:modular]
#           File.write 'config.ru', CONFIG_RU_MODULAR
#           File.write 'main.rb', MAIN_RB_MODULAR
#         else
#           File.write 'config.ru', CONFIG_RU
#           File.write 'main.rb', MAIN_RB
#         end

#         File.write 'Gemfile', GEMFILE

#         File.write 'Procfile', PROCFILE if options[:procfile]

#         FileUtils.mkdir 'public'
#         FileUtils.chdir 'public' do
#           FileUtils.mkdir css_dir
#           FileUtils.mkdir js_dir
#         end

#         if options[:views]
#           FileUtils.mkdir 'views'
#           FileUtils.chdir 'views' do
#             File.write 'layout.erb', LAYOUT_ERB
#             File.write 'index.erb', INDEX_ERB
#           end     
#         end
           
#       end
#       "app generated in #{folder_name}/"
#     end
#   end

# end
<% if options[:modular] %>

require 'sinatra/base' 

class HelloWorld < Sinatra::Base
  get '/' do
    'hello world'
  end
end

<% else %>     

require 'sinatra'

get '/' do
  'hello world'
end

<% end %>





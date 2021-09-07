<%- options[:views] ? @view = 'erb :index' : @view = "'hello world'" -%>
<%- if options[:modular] -%>
require 'sinatra/base'  

class HelloWorld < Sinatra::Base
  get '/' do
    <%= @view %>
  end
end

<%- else -%>     
require 'sinatra'

<%- end -%>
<%- if options[:reloader] -%>
  require 'sinatra/reloader'
<%- end -%>
get '/' do
  <%= @view %>
end

<%- end -%>





<%- if options[:modular] %>
require 'bundler'
Bundler.require
<% end %>

require './main'
<%- if options[:modular] %>
run HelloWorld
<% else %>
run Sinatra::Application
<% end %>
# SinatraGenerator

generate a simple hello world sinatra app

## Installation

Install it yourself as:

    $ gem install sinatra_generator


## Usage:

    sinatra new [APP_NAME]

## Options:

    -m, [--modular=MODULAR]    # modular style. Inherits from Sinatra::Base
    -v, [--views=VIEWS]        # include views folder, index.erb and layout.erb
    -a, [--assets=ASSETS]      # include public, javascripts and stylesheets folder
    -p, [--procfile=PROCFILE]  # include Procfile

## example

    sinatra new blog -mvpa
        
    .
    ├── config.ru
    ├── Gemfile
    ├── main.rb
    ├── Procfile
    ├── public
    │   ├── javascripts
    │   │   └── application.js
    │   └── stylesheets
    │       └── main.css
    └── views
        ├── index.erb
        └── layout.erb

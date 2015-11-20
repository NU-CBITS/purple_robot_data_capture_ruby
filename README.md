# Purple Robot Data Capture

[![Build Status](https://travis-ci.org/cbitstech/purple_robot_data_capture_ruby.svg)](https://travis-ci.org/cbitstech/purple_robot_data_capture_ruby)
[![security](https://hakiri.io/github/cbitstech/purple_robot_data_capture_ruby/master.svg)](https://hakiri.io/github/cbitstech/purple_robot_data_capture_ruby/master)

## Dependencies

None, although you will probably want to install at least a minimal webserver.

## Rack example

### Install the gem

    $ git clone https://github.com/cbitstech/purple_robot_data_capture_ruby.git
    ...
    $ cd purple_robot_data_capture_ruby; gem build purple_robot_data_capture_ruby.gemspec
    ...
    $ gem install purple_robot_data_capture_ruby-X.X.X.gem
    ...

### Install Rack

    $ gem install rack
    ...

### Write a Rack application

A Rack application can exist as a single file, typically with a `.ru` extension.

Create a `config.ru` file:

```ruby
require 'purple_robot'

run Proc.new { |env|
  json = PurpleRobot::RackHelper.from_env(env).json
  payload = PurpleRobot::Payload.new(json)
  payload.readings.each do |reading|
    # do something with reading
  end
  ['200',
   {'Content-Type' => 'application/json'},
   [ payload.success_body.to_json ]]
}
```

run `rackup config.ru` and

configure your Purple Robot HTTP Upload Endpoint to `http://your-ip:9292/`

## Rails example

### Install Rails

    $ gem install rails
    ...

### Create and configure the application

    $ rails new pr_endpoint
    ...
    $ echo "gem 'purple_robot_data_capture_ruby', \
      git: 'https://github.com/cbitstech/purple_robot_data_capture_ruby.git'" \
      >> Gemfile
    ...
    $ bundle install
    ...

add to your `config/routes.rb`

```ruby
resources :payloads, only: :create
```

create a controller `app/controllers/payloads_controller.rb`

```ruby
require 'purple_robot'

class PayloadsController < ActionController::Base
  def create
    payload = PurpleRobot::Payload.new(params[:json])

    payload.readings.each do |reading|
      # do something with reading
    end

    render json: payload.success_body, status: 200
  end
end
```

start the app

    $ bin/rails s
    ...

configure your Purple Robot HTTP Upload Endpoint to `http://your-ip:3000/payloads`

## Running specs

`rake` or `rake test`

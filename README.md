# Purple Robot Data Capture

[![Build Status](https://travis-ci.org/cbitstech/purple_robot_data_capture_ruby.svg)](https://travis-ci.org/cbitstech/purple_robot_data_capture_ruby) [![security](https://hakiri.io/github/cbitstech/purple_robot_data_capture_ruby/master.svg)](https://hakiri.io/github/cbitstech/purple_robot_data_capture_ruby/master)

## Example with Rack

Create a `config.ru` file:

    require 'purple_robot'
   
    run Proc.new { |env|
      json = PurpleRobot::RackHelper.from_env(env).json
      payload = PurpleRobot::Payload.new(json)
      payload.readings.each do |reading|
        # do something with reading
      end
      ['200', {'Content-Type' => 'application/json'}, [ payload.success_body.to_json ]]
    }

run `rackup config.ru` and configure your Purple Robot HTTP Upload Endpoint to
`http://your-ip:9292/`

require 'uri'

module PurpleRobot
  # A helper class for parsing JSON POST data in a Rack application.
  class RackHelper
    attr_reader :json

    def self.from_env(env)
      json = URI.decode(env['rack.input'].read).gsub(/^json=/, '')
      env['rack.input'].rewind

      new(json)
    end

    def initialize(json)
      @json = json
    end
  end
end

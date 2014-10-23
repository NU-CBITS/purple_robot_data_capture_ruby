require 'purple_robot/version'

# nodoc
module PurpleRobot
  class ChecksumError < StandardError
  end

  autoload :EmittedReading, 'purple_robot/emitted_reading'
  autoload :Payload, 'purple_robot/payload'
  autoload :RackHelper, 'purple_robot/rack_helper'
end

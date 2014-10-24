require 'probe'

module PurpleRobot
  module Probes
    # The current state of the network connection.
    class NetworkProbeReading < ProbeReading
      NAME_SUFFIX = '.builtin.NetworkProbe'.freeze
      ATTRIBUTES = [
        :HOSTNAME,
        :INTERFACE_DISPLAY,
        :INTERFACE_NAME,
        :IP_ADDRESS
      ]
    end
  end
end

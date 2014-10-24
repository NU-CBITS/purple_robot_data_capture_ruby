module PurpleRobot
  module Probes
    # Values representing the status and health of the device battery.
    class BatteryProbeReading < ProbeReading
      NAME_SUFFIX = '.builtin.BatteryProbe'.freeze
      ATTRIBUTES = [
        :plugged,
        :voltage,
        :level,
        :status,
        :invalid_charger,
        :health,
        :temperature,
        :'icon-small',
        :technology,
        :scale
      ]
    end
  end
end

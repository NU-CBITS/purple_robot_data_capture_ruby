module PurpleRobot
  # nodoc
  module Probes
    autoload :BatteryProbe, 'purple_robot/probes/battery_probe'
    autoload :RunningSoftwareProbe, 'purple_robot/probes/running_software_probe'
    autoload :SoftwareInformationProbe,
             'purple_robot/probes/software_information_probe'
  end
end

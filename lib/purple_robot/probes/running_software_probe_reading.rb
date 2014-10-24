module PurpleRobot
  module Probes
    # The currently running applications.
    class RunningSoftwareProbeReading < ProbeReading
      NAME_SUFFIX = '.builtin.RunningSoftwareProbe'.freeze
      ATTRIBUTES = [
        :RUNNING_TASKS,
        :RUNNING_TASK_COUNT
      ]
    end
  end
end

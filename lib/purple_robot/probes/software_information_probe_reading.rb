module PurpleRobot
  module Probes
    # Currently installed applications.
    class SoftwareInformationProbeReading < ProbeReading
      NAME_SUFFIX = '.builtin.SoftwareInformationProbe'.freeze
      ATTRIBUTES = [
        :CODENAME,
        :INSTALLED_APPS,
        :INSTALLED_APP_COUNT,
        :RELEASE,
        :INCREMENTAL,
        :SDK_INT
      ]
    end
  end
end

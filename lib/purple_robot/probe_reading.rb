module PurpleRobot
  # A captured and transmitted reading from a Purple Robot probe.
  class ProbeReading
    NAME_PREFIX = 'edu.northwestern.cbits.purple_robot_manager.probes'.freeze

    attr_reader :probe, :timestamp, :guid, :attributes

    def initialize(attributes)
      attrs = Hash[attributes]
      @probe = attrs.delete('PROBE')
      @timestamp = Time.at(attrs.delete('TIMESTAMP'))
      @guid = attrs.delete('GUID')
      @attributes = attrs
    end
  end
end

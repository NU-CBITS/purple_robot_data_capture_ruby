module PurpleRobot
  # A single probe or emitted reading.
  class EmittedReading
    attr_reader :probe, :value, :timestamp, :guid

    def initialize(attributes)
      @probe = attributes['PROBE']
      @value = attributes['FEATURE_VALUE']
      @timestamp = Time.at(attributes['TIMESTAMP'])
      @guid = attributes['GUID']
    end
  end
end

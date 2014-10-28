require 'digest'
require 'json'

module PurpleRobot
  # An unexpected checksum was received with the payload.
  class ChecksumError < StandardError
  end

  # A data package containing one or more Probe Readings.
  class Payload
    def initialize(json)
      @data = JSON.parse(json)
      validate!
    end

    def readings
      @readings ||= (
        payload = JSON.parse(@data['Payload'])

        payload.map { |reading| PurpleRobot::ProbeReading.new(reading) }
      )
    end

    def success_body
      body = {
        Status: 'success',
        Payload: '{}'
      }
      md5 = Digest::MD5.new
      md5.update(body[:Status] + body[:Payload])
      body[:Checksum] = md5.hexdigest

      body
    end

    private

    def validate!
      md5 = Digest::MD5.new
      md5.update(@data['UserHash'] + @data['Operation'] + @data['Payload'])
      expected = md5.hexdigest
      return if expected == @data['Checksum']

      fail ChecksumError, "invalid checksum: expected #{ expected } " \
                          "got #{ @data['Checksum'] }"
    end
  end
end

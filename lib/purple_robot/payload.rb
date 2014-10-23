require 'digest'
require 'json'

module PurpleRobot
  # A data package containing one or more Emitted Readings.
  class Payload
    def initialize(json)
      @data = JSON.parse(json)
      validate!
    end

    def readings
      @readings ||= (
        payload = JSON.parse(@data['Payload'])

        payload.map { |reading| PurpleRobot::EmittedReading.new(reading) }
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
      return if md5.hexdigest == @data['Checksum']

      fail ChecksumError('invalid payload checksum')
    end
  end
end

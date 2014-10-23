require 'minitest/autorun'
require_relative '../../lib/purple_robot/emitted_reading'

module PurpleRobot
  describe EmittedReading do
    before do
      @reading = EmittedReading.new(
        'PROBE' => 'flux capacitor',
        'FEATURE_VALUE' => 1.21,
        'TIMESTAMP' => 1414095283,
        'GUID' => '606e290f-2e1f-4680-b8be-882a188368d3'
      )
    end

    it 'should make the values accessible' do
      @reading.probe.must_equal 'flux capacitor'
      @reading.value.must_equal 1.21
      @reading.timestamp.must_equal Time.at(1414095283)
      @reading.guid.must_equal '606e290f-2e1f-4680-b8be-882a188368d3'
    end
  end
end

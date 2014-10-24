require 'minitest/autorun'
require_relative '../../lib/purple_robot/probe'

module PurpleRobot
  describe ProbeReading do
    before do
      @reading = ProbeReading.new(
        'PROBE' => 'flux capacitor',
        'TIMESTAMP' => 1_414_095_283,
        'GUID' => '606e290f-2e1f-4680-b8be-882a188368d3',
        'FEATURE_VALUE' => 1.21
      )
    end

    it 'should make the values accessible' do
      @reading.probe.must_equal 'flux capacitor'
      @reading.timestamp.must_equal Time.at(1_414_095_283)
      @reading.guid.must_equal '606e290f-2e1f-4680-b8be-882a188368d3'
      @reading.attributes['FEATURE_VALUE'].must_equal 1.21
    end
  end
end

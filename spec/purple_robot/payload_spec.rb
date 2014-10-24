require 'minitest/autorun'
require_relative '../../lib/purple_robot/payload'

module PurpleRobot
  describe Payload do
    describe 'given an invalid checksum' do
      it 'should raise an error' do
        proc do
          Payload.new({
            'UserHash' => 'asdf',
            'Operation' => 'do things',
            'Payload' => 'abcde',
            'Checksum' => 'baz'
          }.to_json)
        end.must_raise ChecksumError
      end
    end

    describe 'given a valid checksum' do
      it 'should not raise an error' do
        Payload.new({
          'UserHash' => 'asdf',
          'Operation' => 'do things',
          'Payload' => 'abcde',
          'Checksum' => '5fb192ff52a83989c818d5c4eab1ae9c'
        }.to_json)
      end
    end
  end
end

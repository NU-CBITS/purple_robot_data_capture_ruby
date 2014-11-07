require 'minitest/autorun'
require_relative '../../lib/purple_robot/payload'

module PurpleRobot
  describe Payload do
    let(:valid_payload) do
      {
        'UserHash' => 'asdf',
        'Operation' => 'do things',
        'Payload' => 'abcde',
        'Checksum' => '5fb192ff52a83989c818d5c4eab1ae9c'
      }
    end

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
        Payload.new(valid_payload.to_json)
      end

      it 'should set the user_hash attribute' do
        Payload.new(valid_payload.to_json)
          .user_hash.must_equal valid_payload['UserHash']
      end

      it 'should set the operation attribute' do
        Payload.new(valid_payload.to_json)
          .operation.must_equal valid_payload['Operation']
      end
    end
  end
end

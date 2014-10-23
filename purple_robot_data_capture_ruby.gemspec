$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'purple_robot'

Gem::Specification.new do |s|
  s.name = 'purple_robot_data_capture_ruby'
  s.version = PurpleRobot::VERSION
  s.summary = 'A library for parsing data payloads sent by Purple Robot.'
  s.description = 'This library provides helpers for parsing and responding' \
                  'to Purple Robot probe data payloads.'
  s.authors = ['Eric Carty-Fickes']
  s.email = 'ericcf@northwestern.edu'
  s.files = [
    'README.md', 'lib/purple_robot.rb', 'lib/purple_robot/version.rb',
    'lib/purple_robot/emitted_reading.rb', 'lib/purple_robot/payload.rb',
    'lib/purple_robot/rack_helper.rb'
  ]
  s.homepage = 'https://github.com/cbitstech/purple_robot_data_capture_ruby'
  s.license = 'MIT'
end

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
  s.files = ['README.md', 'lib/purple_robot.rb'] +
            Dir['lib/purple_robot/**/*.rb']
  s.homepage = 'https://github.com/cbitstech/purple_robot_data_capture_ruby'
  s.license = 'MIT'

  s.add_development_dependency 'rake', '~> 10.3'
  s.add_development_dependency 'rubocop', '~> 0.26'
end

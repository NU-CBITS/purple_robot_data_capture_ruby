require 'rake/testtask'

Rake::TestTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
end

require 'rubocop/rake_task'

RuboCop::RakeTask.new

task :default do
  Rake::Task['rubocop'].invoke
  Rake::Task['test'].invoke
end

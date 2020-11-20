require 'rubocop/rake_task'
require 'optparse'
require_relative 'lib/app'

task default: %w[lint test]

RuboCop::RakeTask.new(:lint) do |task|
	task.patterns = ['lib/**/*.rb', 'test/**/*.rb']
	task.fail_on_error = false
end

task :run do
  app = App.new
  app.hello
end

task :test do
  ruby 'test/test_app.rb'
end
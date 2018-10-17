require 'rake'
require 'rspec'
require 'rspec/core/rake_task'

desc "Run specs"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = "spec/valera_quest/*_spec.rb"
  path = File.join(File.dirname(__FILE__), '/src')
  t.rspec_opts = "-I#{path} --color --format doc"
end

task :default => [:spec]

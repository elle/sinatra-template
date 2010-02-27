Dir["lib/*.rb"].each { |x| load x }

require 'spec/rake/spectask'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new do |t|
  t.cucumber_opts = %w{--format pretty}
end

task :default => :test
task :test => :spec

if !defined?(Spec)
  puts "spec targets require RSpec"
else
  desc "Run all examples"
  Spec::Rake::SpecTask.new('spec') do |t|
    t.spec_files = FileList['spec/**/*.rb']
    t.spec_opts = ['-cfs']
  end
end

namespace :db do
  desc 'Reset the database (destroys data)'
  task :reset => [:down, :up]

  desc 'Auto-upgrade the database (preserves data)'
  task :migrate do
    Schema.up
  end
  
  desc 'Loses all data'
  task :down do
    Schema.down
  end
end

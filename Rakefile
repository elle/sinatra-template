Dir["lib/*.rb"].each { |x| load x }

require 'spec/rake/spectask'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new do |t|
  t.cucumber_opts = %w{--format pretty}
end

# Run 'rake -T' to see list of generated tasks (from gem root directory)
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
  desc 'Reset the database (loses all data)'
  task :reset => [:down, :up]

  desc 'Upgrade the database (preserves data)'
  task :up do
    Schema.up
  end
  
  desc 'Loses all data'
  task :down do
    Schema.down
  end
  
  desc 'Bootstraps the database'
  task :bootstrap do
    [ ['First Post', 'first-post', 'some body text', 1, 1],
      ['About us', 'about', 'Lorem ipsum dolor', 0, 1],
      ['A second post', 'second', 'Something not interesting enough', 1, 0]
    ].map { |title, slug, body, is_article, is_live| Page.create(:title => title, :slug => slug, :body => body, :is_article => is_article, :is_live => is_live) }
  end
end

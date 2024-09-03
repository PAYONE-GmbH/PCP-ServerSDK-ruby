require "bundler/gem_tasks"
require 'rubocop/rake_task'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :default => [:spec]

RuboCop::RakeTask.new # named rubocop

desc "Build and release the gem to RubyGems"
task :release => [:rubocop, :spec, :build] do
  version = `git tag --list`.split("\n").last
  puts "Releasing version #{version}"
  system("gem push pkg/#{File.basename(Dir.glob("*.gemspec").first, ".gemspec")}-#{version}.gem")
end

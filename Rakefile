#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

GitcycleApi2::Application.load_tasks

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = "-f d"
end

Rake::Task["default"].clear
task :default => :spec
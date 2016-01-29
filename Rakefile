begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'rdoc/task'

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Civo'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

Bundler::GemHelper.install_tasks

task :console do
  ENV["CIVO_URL"] ||= "https://api.civo.com"

  require 'irb'
  require 'irb/completion'
  ENGINE_ROOT = File.expand_path('..', __FILE__)
  ENGINE_PATH = File.expand_path('../lib/civo/engine', __FILE__)

  # Set up gems listed in the Gemfile.
  ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
  require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])
  require 'commander/import'
  require 'toml'
  require 'flexirest'
  require_relative "#{ENGINE_ROOT}/lib/civo.rb"

  ARGV.clear
  IRB.start
end
task :c => :console

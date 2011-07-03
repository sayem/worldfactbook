# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "worldfactbook"
  gem.homepage = "http://github.com/sayem/worldfactbook"
  gem.license = "MIT"
  gem.summary = %Q{Easily access all the statistics and economic data available on the CIA World Factbook.}
  gem.description = %Q{Easily use Ruby or the command line to look up any country on the CIA World Factbook.}
  gem.email = "sayem.islam@gmail.com"
  gem.authors = ["Sayem Islam"]

  # Dependencies
  gem.add_dependency('nokogiri')
   
  # Development dependencies
  gem.add_development_dependency('fakeweb')
  gem.add_development_dependency('rspec')
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "worldfactbook #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

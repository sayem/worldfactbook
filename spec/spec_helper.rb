# By default if you have the FakeWeb gem installed when the specs are
# run they will hit recorded responses. However, if you don't have
# the FakeWeb gem installed or you set the environment variable
# LIVE_TEST then the tests will hit the live site rubyworldfactbook.com.
#
# Having both methods available for testing allows you to quickly
# refactor and add features, while also being able to make sure that
# no changes to the rubyworldfactbook.com interface have affected the parser.
#
# Note: rubyworldfactbook.com is a downloaded copy of https://www.cia.gov/library/publications/the-world-factbook/index.html and is regularly updated
#
###

begin
  require 'rspec'
rescue LoadError
  require 'rubygems'
  gem 'rspec'
  require 'rspec'
end

$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'worldfactbook'

def read_fixture(path)
  File.read(File.expand_path(File.join(File.dirname(__FILE__), "fixtures", path)))
end

WORLDFACTBOOK_SAMPLES = {
  "http://rubyworldfactbook.com/geos/us.html" => "united_states",
  "http://rubyworldfactbook.com/geos/uk.html" => "united_kingdom",
  "http://rubyworldfactbook.com/geos/ch.html" => "china",
  "http://rubyworldfactbook.com/geos/rs.html" => "russia",
  "http://rubyworldfactbook.com/geos/br.html" => "brazil",
  "http://rubyworldfactbook.com/geos/sf.html" => "south_africa",
  "http://rubyworldfactbook.com/geos/mo.html" => "morocco",
}

unless ENV['LIVE_TEST']
  begin
    require 'rubygems'
    require 'fakeweb'
    
    FakeWeb.allow_net_connect = false
    WORLDFACTBOOK_SAMPLES.each do |url, response|
      FakeWeb.register_uri(:get, url, :response => read_fixture(response))
    end
  rescue LoadError
    puts "Could not load FakeWeb, these tests will hit rubyworldfactbook.com"
    puts "You can run `gem install fakeweb` to stub out the responses."
  end
end

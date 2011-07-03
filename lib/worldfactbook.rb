$LOAD_PATH.unshift(File.dirname(__FILE__)) unless $LOAD_PATH.include?(File.dirname(__FILE__))

require 'open-uri'
require 'rubygems'
require 'nokogiri'

require 'worldfactbook/country'

module Worldfactbook
  VERSION = File.open(File.join(File.dirname(__FILE__), '..', 'VERSION'), 'r') { |f| f.read.strip }
end

require File.dirname(__FILE__) + '/../spec_helper'
require 'worldfactbook/cli'

describe Worldfactbook::CLI, "execute" do

  describe "help" do
    before(:each) do
      @stdout_io = StringIO.new
      Worldfactbook::CLI.execute(@stdout_io, ['help'])
      @stdout_io.rewind
      @stdout = @stdout_io.read
    end
  
    it "should report help commands" do
      @stdout.should =~ /https:\/\/github.com\/sayem\/worldfactbook\/wiki/
    end
  end

  describe "country list" do
    before(:each) do
      @stdout_io = StringIO.new
      Worldfactbook::CLI.execute(@stdout_io, ['countries'])
      @stdout_io.rewind
      @stdout = @stdout_io.read
    end
  
    it "should report the list of available countries" do
      @stdout.should =~ /List of available countries/
      @stdout.should =~ /jamaica/
    end
  end

  describe "country lookup" do
    before(:each) do
      @stdout_io = StringIO.new
      Worldfactbook::CLI.execute(@stdout_io, ['united states'])
      @stdout_io.rewind
      @stdout = @stdout_io.read
    end
  
    it "should report data" do
      @stdout.should =~ /Location: North America/
      @stdout.should =~ /New York/
      @stdout.should =~ /4 July 1776/
      @stdout.should =~ /Population/
      @stdout.should =~ /English/
      @stdout.should =~ /white/
      @stdout.should =~ /Protestant/
      @stdout.should =~ /0-14 years:/
      @stdout.should =~ /age 15 and over can read and write/
      @stdout.should =~ /GDP:/
      @stdout.should =~ /GDP \(PPP\):/
      @stdout.should =~ /GDP growth:/
      @stdout.should =~ /GDP sectors:/
      @stdout.should =~ /Debt:/
      @stdout.should =~ /Unemployment:/
      @stdout.should =~ /Inflation:/
      @stdout.should =~ /Telephone Users:/
      @stdout.should =~ /Mobile Phone Users:/
      @stdout.should =~ /Internet Users:/
    end
  end

  describe "country lookup parameter" do
    it "should detect parameter" do
      expect {
        Worldfactbook::CLI.execute(@stdout_io, ['united states population'])
      }.should raise_error(Worldfactbook::NoCountryAvailable)
    end
  end
  
end

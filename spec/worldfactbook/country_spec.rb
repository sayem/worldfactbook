require File.dirname(__FILE__) + '/../spec_helper.rb'

# This test uses fixtures/united_states as a testing sample:
#
# http://rubyworldfactbook.com/geos/us.html
#

describe "Worldfactbook::Country" do
  
  describe "valid country" do

    before(:each) do
      # Get 'united states'
      @country = Worldfactbook::Country.new('united states')
    end
  
    it "should list available countries" do
      @country.countries.should be_a(Hash)
    end

    it "should find the flag" do
      @country.flag.should =~ /flags/
    end

    it "should find the regional map" do
      @country.map_location.should =~ /us_locator.gif/
    end

    it "should find the intro" do
      @country.intro.should be_a(String)
    end

    it "should return the geography methods" do
      geography = @country.geography
   
      geography.should be_a(Hash)
      geography.should include('location')
      geography.should include('area')
      geography.should include('area_comparative')
      geography.should include('climate')
      geography.should include('terrain')
      geography.should include('elevation')
      geography.should include('natural_resources')
    end

    it "should return the people methods" do
      people = @country.people
   
      people.should be_a(Hash)
      people.should include('population')
      people.should include('population_growth')
      people.should include('ethnic_groups')
      people.should include('religions')
      people.should include('languages')
      people.should include('sex_ratio')
      people.should include('age_structure')
      people.should include('median_age')
      people.should include('birth_rate')
      people.should include('death_rate')
      people.should include('net_migration')
      people.should include('urbanization')
      people.should include('major_cities')
      people.should include('infant_mortality')
      people.should include('life_expectancy')
      people.should include('fertility_rate')
      people.should include('literacy')
    end



  end
end

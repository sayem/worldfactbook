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

    it "should return the government methods" do
      government = @country.government

      government.should be_a(Hash)
      government.should include('government_type')
      government.should include('capital')
      government.should include('independence')
      government.should include('legal')
      government.should include('executive')
      government.should include('legislative')
      government.should include('judicial')
      government.should include('political')
    end

    it "should return the economy methods" do
      economy = @country.economy

      economy.should be_a(Hash)
      economy.should include('gdp')
      economy.should include('gdp_ppp')
      economy.should include('gdp_growth')
      economy.should include('gdp_capita')
      economy.should include('gdp_sectors')
      economy.should include('labor')
      economy.should include('unemployment')
      economy.should include('inflation')
      economy.should include('markets')
      economy.should include('exports')
      economy.should include('imports')
      economy.should include('debt')
      economy.should include('military')
    end

    it "should return the communications methods" do
      communications = @country.communications

      communications.should be_a(Hash)
      communications.should include('telephones')
      communications.should include('cellphones')
      communications.should include('internet_users')
      communications.should include('internet_hosts')
    end

    it "should return the global methods" do
      global = @country.global

      global.should be_a(Hash)
      global.should include('disputes')
      global.should include('refugees')
      global.should include('drugs')
    end


    ## GEOGRAPHY ##

    it "should find the location" do
      @country.location.should =~ /bordering/
    end

    it "should find the area" do
      @country.area.should =~ /sq km/
    end

    it "should find the area_comparative" do
      @country.area_comparative.should =~ /size of/
    end

    it "should find the climate" do
      @country.climate.should =~ /mostly temperate/
    end

    it "should find the terrain" do
      @country.terrain.should =~ /vast central plain/
    end

    it "should find the elevation" do
      @country.elevation.should =~ /highest point/
    end

    it "should find the natural resources" do
      @country.natural_resources.should =~ /natural gas/
    end


    ## PEOPLE

    it "should find the population" do
      @country.population.should =~ /country comparison/
    end

    it "should find the age_structure" do
      @country.age_structure.should =~ /0-14 years/
    end

    it "should find the median_age" do
      @country.median_age.should =~ /[(male:)(female:)]/
    end

    it "should find the population growth" do
      @country.population_growth.should =~ /country comparison/
    end

    it "should find the birth rate" do
      @country.birth_rate.should =~ /births/
    end

    it "should find the death rate" do
      @country.death_rate.should =~ /deaths/
    end

    it "should find the net migration" do
      @country.net_migration.should =~ /migrant/
    end

    it "should find the urbanization" do
      @country.urbanization.should =~ /urbanization/
    end

    it "should find the major cities" do
      @country.major_cities.should =~ /New York/
    end

    it "should find the sex ratio" do
      @country.sex_ratio.should =~ /female/
    end

    it "should find the infant mortality" do
      @country.infant_mortality.should =~ /deaths\/1,000 live births/
    end

    it "should find the life expectancy" do
      @country.life_expectancy.should =~ /years/
    end

    it "should find the fertility rate" do
      @country.fertility_rate.should =~ /children born\/woman/
    end

    it "should find the ethnic groups" do
      @country.ethnic_groups.should =~ /white/
    end

    it "should find the religions" do
      @country.religions.should =~ /Protestant/
    end

    it "should find the languages" do
      @country.languages.should =~ /English/
    end

    it "should find the literacy" do
      @country.literacy.should =~ /read and write/
    end


    ## GOVERNMENT ##

    it "should find the government type" do
      @country.government_type.should =~ /federal republic/
    end

    it "should find the capital" do
      @country.capital.should =~ /Washington, DC/
    end

    it "should find the date of independence" do
      @country.independence.should =~ /4 July 1776/
    end

    it "should find the legal system" do
      @country.legal.should =~ /common law/
    end

    it "should find the executive system" do
      @country.executive.should =~ /chief of state/
    end

    it "should find the legislative system" do
      @country.legislative.should =~ /Congress/
    end

    it "should find the judicial system" do
      @country.judicial.should =~ /Supreme Court/
    end

    it "should find the political parties" do
      @country.political.should =~ /Party/
    end


    ## ECONOMY ##

    it "should find the economy overview" do
      @country.economy_overview.should =~ /economy/
    end

    it "should find the gdp" do
      @country.gdp.should =~ /trillion/
    end

    it "should find the gdp (ppp)" do
      @country.gdp_ppp.should =~ /trillion/
    end

    it "should find the gdp growth" do
      @country.gdp_growth.should =~ /country comparison/
    end

    it "should find the gdp capita" do
      @country.gdp_capita.should =~ /country comparison/
    end

    it "should find gdp sectors" do
      @country.gdp_sectors.should =~ /industry/
    end

    it "should find labor" do
      @country.labor.should =~ /includes unemployed/
    end

    it "should find unemployment" do
      @country.unemployment.should =~ /country comparison/
    end

    it "should find inflation" do
      @country.inflation.should =~ /country comparison/
    end

    it "should find markets" do
      @country.markets.should =~ /trillion/
    end

    it "should find exports" do
      @country.exports.should =~ /trillion/
    end

    it "should find imports" do
      @country.imports.should =~ /trillion/
    end

    it "should find debt" do
      @country.debt.should =~ /trillion/
    end

    it "should find military expenditures" do
      @country.military.should =~ /of GDP/
    end


    ## COMMUNICATIONS ##

    it "should find telephones" do
      @country.telephones.should =~ /million/
    end

    it "should find cellphones" do
      @country.cellphones.should =~ /million/
    end

    it "should find internet users" do
      @country.internet_users.should =~ /million/
    end

    it "should find internet hosts" do
      @country.internet_hosts.should =~ /US Internet/
    end


    ## GLOBAL ISSUES ##

    it "should find disputes" do
      @country.disputes.should =~ /US/
    end

    it "should find refugees" do
      @country.refugees.should =~ /refugees/
    end

    it "should find drugs" do
      @country.drugs.should =~ /cocaine/
    end

  end
end

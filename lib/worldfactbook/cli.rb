module Worldfactbook
  class CLI
    def self.execute(stdout, arguments=[])
      @stdout = stdout
      if !arguments.empty? 
        query = arguments.join(" ").strip
        if !['help', 'countries'].include?(query)
          begin
            @country = query
            Country.new(query)
          rescue Worldfactbook::NoCountryAvailable
            @data = arguments.pop
            query = arguments.join(" ").strip
            @country = query
            Country.new(query)
          end
        end
      end
      
      @stdout.puts "Worldfactbook | https://github.com/sayem/worldfactbook"
      @stdout.puts

      if arguments[0] == 'help'
        @stdout.puts "'worldfactbook countries' => lists all the countries available in the CIA World Factbook, along with their two-letter country codes"       
        @stdout.puts
        @stdout.puts "'worldfactbook [country or code]' => fetches the location, major cities, date of independence, population, languages, ethnic groups, religions, age structure, literacy rate, GDP, GDP (PPP), GDP growth, GDP sectors, debt, unemployment, inflation, telephone users, mobile phone users, and internet users for the given country"
        @stdout.puts
        @stdout.puts "'worldfactbook [country or code] [parameter]' => returns information from the given method for the country (e.g. 'worldfactbook united states population')"              
        @stdout.puts
        @stdout.puts "List of available country methods can be found at: https://github.com/sayem/worldfactbook/wiki"
        @stdout.puts
      elsif arguments[0] == 'countries'
        @stdout.puts "List of available countries (input 'worldfactbook [country or code]' to fetch data for that country):"
        @stdout.puts
        @stdout.puts CountryCode.new('xx').list
      elsif @data
        @stdout.puts Country.new(@country).send(@data)
        @stdout.puts
      elsif @country
        @stdout.puts "Location: #{Country.new(@country).location}"
        @stdout.puts "Major Cities: #{Country.new(@country).major_cities}"
        @stdout.puts "Independence: #{Country.new(@country).independence}"
        @stdout.puts
        @stdout.puts "Population: #{Country.new(@country).population}"
        @stdout.puts "Languages: #{Country.new(@country).languages}"
        @stdout.puts "Ethnic Groups: #{Country.new(@country).ethnic_groups}"
        @stdout.puts "Religions: #{Country.new(@country).religions}"
        @stdout.puts "Age Structure: #{Country.new(@country).age_structure}"
        @stdout.puts "Literacy: #{Country.new(@country).literacy}"
        @stdout.puts
        @stdout.puts "GDP: #{Country.new(@country).gdp}"
        @stdout.puts "GDP (PPP): #{Country.new(@country).gdp_ppp}"
        @stdout.puts "GDP growth: #{Country.new(@country).gdp_growth}"
        @stdout.puts "GDP sectors: #{Country.new(@country).gdp_sectors}"
        @stdout.puts "Debt: #{Country.new(@country).debt}"
        @stdout.puts "Unemployment: #{Country.new(@country).unemployment}"
        @stdout.puts "Inflation: #{Country.new(@country).inflation}"
        @stdout.puts
        @stdout.puts "Telephone Users: #{Country.new(@country).telephones}"
        @stdout.puts "Mobile Phone Users: #{Country.new(@country).cellphones}"
        @stdout.puts "Internet Users: #{Country.new(@country).internet_users}"
        @stdout.puts
      end
    end
  end
end

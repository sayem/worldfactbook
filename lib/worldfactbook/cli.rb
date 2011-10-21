module Worldfactbook
  class CLI
    def self.execute(stdout, arguments=[])
      @stdout = stdout
      if !arguments.empty?
        query = arguments.join(" ").strip
        if !['help', 'countries'].include?(query)
          begin
            @country = Country.new(query)
          rescue Worldfactbook::NoCountryAvailable
            @data = arguments.pop
            query = arguments.join(" ").strip
            @country = Country.new(query)
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
        @stdout.puts @country.send(@data)
        @stdout.puts
      elsif @country
        @stdout.puts "Location: #{@country.location}"
        @stdout.puts "Major Cities: #{@country.major_cities}"
        @stdout.puts "Independence: #{@country.independence}"
        @stdout.puts
        @stdout.puts "Population: #{@country.population}"
        @stdout.puts "Languages: #{@country.languages}"
        @stdout.puts "Ethnic Groups: #{@country.ethnic_groups}"
        @stdout.puts "Religions: #{@country.religions}"
        @stdout.puts "Age Structure: #{@country.age_structure}"
        @stdout.puts "Literacy: #{@country.literacy}"
        @stdout.puts
        @stdout.puts "GDP: #{@country.gdp}"
        @stdout.puts "GDP (PPP): #{@country.gdp_ppp}"
        @stdout.puts "GDP growth: #{@country.gdp_growth}"
        @stdout.puts "GDP sectors: #{@country.gdp_sectors}"
        @stdout.puts "Debt: #{@country.debt}"
        @stdout.puts "Unemployment: #{@country.unemployment}"
        @stdout.puts "Inflation: #{@country.inflation}"
        @stdout.puts
        @stdout.puts "Telephone Users: #{@country.telephones}"
        @stdout.puts "Mobile Phone Users: #{@country.cellphones}"
        @stdout.puts "Internet Users: #{@country.internet_users}"
        @stdout.puts
      end
    end
  end
end

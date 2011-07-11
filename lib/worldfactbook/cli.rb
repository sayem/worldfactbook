require 'optparse'

module Worldfactbook
  class CLI
    def self.execute(stdout, arguments=[])
      @stdout = stdout
      @country = arguments[0]
      @data = arguments[1]

      @stdout.puts "Worldfactbook | http://github.com/sayem/worldfactbook"
      @stdout.puts

      if @country == 'help'
        @stdout.puts Country.new('xx').help
      elsif @country == 'countries'
        @stdout.puts CountryCode.new('xx').list
      elsif @data
        @code = CountryCode.new(@country).code
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

module Worldfactbook

  class Country
    attr_accessor :country

    def initialize(country)
      @country = country.downcase
      @code = CountryCode.new(@country).code
    end

    def help
      # show all available commands and definitions too
    end

    def countries
      CountryCode.new(@country).list
    end

    def flag
      doc.css('.flag_border').to_s.gsub(/\.\.\/graphics/,'http://rubyworldfactbook.com/graphics').gsub(/"/,'').scan(/http\S+/)[0]
    end

    def map_location
      doc.css('#region-content td tr:nth-child(2) td:nth-child(2) img:nth-child(1)').to_s.gsub(/\.\.\/graphics/,'http://rubyworldfactbook.com/graphics').gsub(/"/,'').scan(/http\S+/)[0]
    end

    def map_world  # need to check this with others ---- doesnt work for US, maybe just take it out, otherwise customize it
      doc.css('#noa_smmapborder').to_s.gsub(/\.\.\/graphics/,'http://rubyworldfactbook.com/graphics').gsub(/"/,'').scan(/http\S+/)[0]
    end

    def intro
      doc.css('#CollapsiblePanel1_Intro #data .category_data').text
    end

    def geography
      return [self.location, self.area, self.area_comparative, self.climate, self.terrain, self.elevation, self.natural_resources]
    end

    def people
      return [self.population, self.population_growth, self.ethnic_groups, self.religions, self.languages, self.sex_ratio, self.age_structure, self.median_age, self.birth_rate, self.death_rate, self.net_migration, self.urbanization, self.major_cities,  self.infant_mortality, self.life_expectancy, self.fertility_rate, self.literacy]
    end

    def government
      return [self.government_type, self.capital, self.independence, self.legal, self.executive, self.legislative, self.judicial, self.political]
    end

    def economy   
      return [self.gdp, self.gdp_ppp, self.gdp_growth, self.gdp_capita, self.gdp_sectors, self.labor, self.unemployment, self.inflation, self.markets, self.exports, self.imports, self.debt, self.military]

      # economy_overview not included
    end

    def communications
      return [self.telephones, self.cellphones, self.internet_users, self.internet_hosts]
    end

    def global
      return [self.disputes, self.refugees, self.drugs]
    end


    ## GEOGRAPHY ##

    def location
      doc.css('#CollapsiblePanel1_Geo tr:nth-child(2) .category_data').text
    end

    def area
      doc.css('#CollapsiblePanel1_Geo tr:nth-child(11) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def area_comparative
      doc.css('#CollapsiblePanel1_Geo tr:nth-child(14) .category_data').text
    end

    def climate
      doc.css('#CollapsiblePanel1_Geo tr:nth-child(26) .category_data').text
    end

    def terrain
      doc.css('#CollapsiblePanel1_Geo tr:nth-child(29) .category_data').text
    end

    def elevation
      doc.css('#CollapsiblePanel1_Geo tr:nth-child(32) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def natural_resources
      doc.css('#CollapsiblePanel1_Geo tr:nth-child(35) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end


    ## PEOPLE ##

    def population
      doc.css('#CollapsiblePanel1_People tr:nth-child(2) #data').text.squeeze(' ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def age_structure
      doc.css('#CollapsiblePanel1_People tr:nth-child(5) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def median_age
      doc.css('#CollapsiblePanel1_People tr:nth-child(8) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def population_growth
      doc.css('#CollapsiblePanel1_People tr:nth-child(11) #data').text.squeeze(' ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def birth_rate
      doc.css('#CollapsiblePanel1_People tr:nth-child(14) #data').text.squeeze(' ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def death_rate
      doc.css('#CollapsiblePanel1_People tr:nth-child(17) #data').text.squeeze(' ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def net_migration
      doc.css('#CollapsiblePanel1_People tr:nth-child(20) #data').text.squeeze(' ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def urbanization
      doc.css('#CollapsiblePanel1_People tr:nth-child(23) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def major_cities
      doc.css('#CollapsiblePanel1_People tr:nth-child(26) .category_data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def sex_ratio
      doc.css('#CollapsiblePanel1_People tr:nth-child(29) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def infant_mortality
      doc.css('#CollapsiblePanel1_People tr:nth-child(32) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def life_expectancy
      doc.css('#CollapsiblePanel1_People tr:nth-child(35) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def fertility_rate
      doc.css('#CollapsiblePanel1_People tr:nth-child(38) #data').text.squeeze(' ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def ethnic_groups
      doc.css('#CollapsiblePanel1_People tr:nth-child(59) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def religions
      doc.css('#CollapsiblePanel1_People tr:nth-child(62) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def languages
      doc.css('#CollapsiblePanel1_People tr:nth-child(65) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def literacy
      doc.css('#CollapsiblePanel1_People tr:nth-child(68) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end


    ## GOVERNMENT ##    

    def government_type
      doc.css('#CollapsiblePanel1_Govt tr:nth-child(5) .category_data').text
    end
    
    def capital
      doc.css('#CollapsiblePanel1_Govt tr:nth-child(8) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def independence
      doc.css('#CollapsiblePanel1_Govt tr:nth-child(17) #data').text.squeeze(' ').gsub(/[\r\t\n]/,'').strip
    end

    def legal
      doc.css('#CollapsiblePanel1_Govt tr:nth-child(26) #data').text.squeeze(' ').gsub(/[\r\t\n]/,'').strip
    end

    def executive
      doc.css('#CollapsiblePanel1_Govt tr:nth-child(35) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def legislative
      doc.css('#CollapsiblePanel1_Govt tr:nth-child(38) #data').text.squeeze(' ').gsub(/[\r\t\n]/,'').strip
    end

    def judicial
      doc.css('#CollapsiblePanel1_Govt tr:nth-child(41) #data').text.squeeze(' ').gsub(/[\r\t\n]/,'').strip
    end

    def political
      doc.css('#CollapsiblePanel1_Govt tr:nth-child(44) #data').text.squeeze(' ').gsub(/[\r\t\n]/,'').strip
    end


    ## ECONOMY ##    

    def economy_overview 
      doc.css('#CollapsiblePanel1_Econ tr:nth-child(2) .category_data').text
    end

    def gdp
      doc.css('#CollapsiblePanel1_Econ tr:nth-child(8) .category_data').text
    end

    def gdp_ppp
      doc.css('#CollapsiblePanel1_Econ tr:nth-child(5) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def gdp_growth
      doc.css('#CollapsiblePanel1_Econ tr:nth-child(11) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def gdp_capita
      doc.css('#CollapsiblePanel1_Econ tr:nth-child(14) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def gdp_sectors
      doc.css('#CollapsiblePanel1_Econ tr:nth-child(17) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def labor 
      doc.css('#CollapsiblePanel1_Econ tr:nth-child(20) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def unemployment 
      doc.css('#CollapsiblePanel1_Econ tr:nth-child(26) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def inflation 
      doc.css('#CollapsiblePanel1_Econ tr:nth-child(47) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def markets
      doc.css('#CollapsiblePanel1_Econ tr:nth-child(65) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def exports 
      doc.css('#CollapsiblePanel1_Econ tr:nth-child(122) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def imports 
      doc.css('#CollapsiblePanel1_Econ tr:nth-child(131) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def debt
      doc.css('#CollapsiblePanel1_Econ tr:nth-child(143) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def military
      doc.css('#CollapsiblePanel1_Military tr:nth-child(17) #data').text.squeeze(' ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end


    ## COMMUNICATIONS ##    

    def telephones
      doc.css('#CollapsiblePanel1_Comm tr:nth-child(2) #data').text.squeeze(' ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def cellphones
      doc.css('#CollapsiblePanel1_Comm tr:nth-child(5) #data').text.squeeze(' ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def internet_users
      doc.css('#CollapsiblePanel1_Comm tr:nth-child(20) #data').text.squeeze(' ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def internet_hosts
      doc.css('#CollapsiblePanel1_Comm tr:nth-child(17) #data').text.squeeze(' ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end


    ## GLOBAL ##    

    def disputes
      doc.css('#CollapsiblePanel1_Issues tr:nth-child(2) .category_data').text
    end

    def refugees
      doc.css('#CollapsiblePanel1_Issues tr:nth-child(5) .category_data').text
    end

    def drugs
      doc.css('#CollapsiblePanel1_Issues tr:nth-child(8) .category_data').text
    end


    private

    def doc
      @document ||= Nokogiri::HTML(open("http://rubyworldfactbook.com/geos/#{@code}.html"))
    end    
  end

end

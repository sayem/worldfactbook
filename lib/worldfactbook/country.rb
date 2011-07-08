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

    def map_world
      return "http://rubyworldfactbook.com/graphics/maps/newmaps/#{@code}-map.gif"
    end

    def intro
      doc.css('#CollapsiblePanel1_Intro #data .category_data').text
    end

    def geography
      return { 'location' => self.location, 'area' => self.area, 'area_comparative' => self.area_comparative, 'climate' => self.climate, 'terrain' => self.terrain, 'elevation' => self.elevation, 'natural_resources' => self.natural_resources }
    end

    def people
      return { 'population' => self.population, 'population_growth' => self.population_growth, 'ethnic_groups' => self.ethnic_groups, 'religions' => self.religions, 'languages' => self.languages, 'sex_ratio' => self.sex_ratio, 'age_structure' => self.age_structure, 'median_age' => self.median_age, 'birth_rate' => self.birth_rate, 'death_rate' => self.death_rate, 'net_migration' => self.net_migration, 'urbanization' => self.urbanization, 'major_cities' => self.major_cities, 'infant_mortality' => self.infant_mortality, 'life_expectancy' => self.life_expectancy, 'fertility_rate' => self.fertility_rate, 'literacy' => self.literacy }
    end

    def government
      return { 'government_type' => government_type, 'capital' => self.capital, 'independence' => self.independence, 'legal' => self.legal, 'executive' => self.executive, 'legislative' => self.legislative, 'judicial' => self.judicial, 'political' => self.political }
    end

    def economy   
      return { 'gdp' => self.gdp, 'gdp_ppp' => self.gdp_ppp, 'gdp_growth' => self.gdp_growth, 'gdp_capita' => self.gdp_capita, 'gdp_sectors' => self.gdp_sectors, 'labor' => self.labor, 'unemployment' => self.unemployment, 'inflation' => self.inflation, 'markets' => self.markets, 'exports' => self.exports, 'imports' => self.imports, 'debt' => self.debt, 'military' => self.military }

      # economy_overview not included
    end

    def communications
      return { 'telephones' => self.telephones, 'cellphones' => self.cellphones, 'internet_users' => self.internet_users, 'internet_hosts' => self.internet_hosts }
    end

    def global
      return { 'disputes' => self.disputes, 'refugees' => self.refugees, 'drugs' => self.drugs }
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
      if doc.to_s.match("Definitions and Notes: Major infectious diseases")
        doc.css('#CollapsiblePanel1_People tr:nth-child(62) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip        
      else
        doc.css('#CollapsiblePanel1_People tr:nth-child(59) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
      end
    end

    def religions
      if doc.to_s.match("Definitions and Notes: Major infectious diseases")
        doc.css('#CollapsiblePanel1_People tr:nth-child(65) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
      else
        doc.css('#CollapsiblePanel1_People tr:nth-child(62) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
      end
    end

    def languages
      if doc.to_s.match("Definitions and Notes: Major infectious diseases")
        doc.css('#CollapsiblePanel1_People tr:nth-child(68) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
      else
        doc.css('#CollapsiblePanel1_People tr:nth-child(65) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
      end
    end

    def literacy
      if doc.to_s.match("Definitions and Notes: Major infectious diseases")
        doc.css('#CollapsiblePanel1_People tr:nth-child(71) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
      else
        doc.css('#CollapsiblePanel1_People tr:nth-child(68) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
      end
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

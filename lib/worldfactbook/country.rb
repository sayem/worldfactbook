module Worldfactbook
  require 'iconv'
  
  class Country
    attr_accessor :country, :wfb_location

    def initialize(country)
      @country = country.downcase
      @code = CountryCode.new(@country).code
      @ic = Iconv.new('UTF-8//IGNORE', 'UTF-8')
      @wfb_location = "http://rubyworldfactbook.com"

    end

    def countries
      CountryCode.new(@country).list
    end

    def flag
      (@ic.iconv(doc.css('.flag_border').to_s + ' ')[0..-2]).gsub(/\.\.\/graphics/,'http://rubyworldfactbook.com/graphics').gsub(/"/,'').scan(/http\S+/)[0]
    end

    def map_location
      (@ic.iconv(doc.css('#region-content td tr:nth-child(2) td:nth-child(2) img:nth-child(1)').to_s + ' ')[0..-2]).gsub(/\.\.\/graphics/,'http://rubyworldfactbook.com/graphics').gsub(/"/,'').scan(/http\S+/)[0]
    end

    def map_world
      return "#{@wfb_location}/graphics/maps/newmaps/#{@code}-map.gif"
    end

    def intro
      (@ic.iconv(doc.css('#CollapsiblePanel1_Intro #data .category_data').text + ' ')[0..-2])
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
      (@ic.iconv(doc.css('#CollapsiblePanel1_Geo tr:nth-child(2) .category_data').text + ' ')[0..-2])
    end

    def area
      (@ic.iconv(doc.css('#CollapsiblePanel1_Geo tr:nth-child(11) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def area_comparative
      (@ic.iconv(doc.css('#CollapsiblePanel1_Geo tr:nth-child(14) .category_data').text + ' ')[0..-2])
    end

    def climate
      (@ic.iconv(doc.css('#CollapsiblePanel1_Geo tr:nth-child(26) .category_data').text + ' ')[0..-2])
    end

    def terrain
      (@ic.iconv(doc.css('#CollapsiblePanel1_Geo tr:nth-child(29) .category_data').text + ' ')[0..-2])
    end

    def elevation
      (@ic.iconv(doc.css('#CollapsiblePanel1_Geo tr:nth-child(32) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def natural_resources
      (@ic.iconv(doc.css('#CollapsiblePanel1_Geo tr:nth-child(35) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end


    ## PEOPLE ##

    def population
      (@ic.iconv(doc.css('#CollapsiblePanel1_People tr:nth-child(2) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def age_structure
      (@ic.iconv(doc.css('#CollapsiblePanel1_People tr:nth-child(5) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def median_age
      (@ic.iconv(doc.css('#CollapsiblePanel1_People tr:nth-child(8) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def population_growth
      (@ic.iconv(doc.css('#CollapsiblePanel1_People tr:nth-child(11) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def birth_rate
      (@ic.iconv(doc.css('#CollapsiblePanel1_People tr:nth-child(14) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def death_rate
      (@ic.iconv(doc.css('#CollapsiblePanel1_People tr:nth-child(17) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def net_migration
      if ['xx'].include?(@code)
        return nil
      else
        (@ic.iconv(doc.css('#CollapsiblePanel1_People tr:nth-child(20) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
      end
    end

    def urbanization
      if ['ee'].include?(@code)
        return nil
      elsif ['xx'].include?(@code)
        (@ic.iconv(doc.css('#CollapsiblePanel1_People tr:nth-child(20) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
      else
        (@ic.iconv(doc.css('#CollapsiblePanel1_People tr:nth-child(23) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
      end
    end
    
    def major_cities
      if ['ee', 'xx'].include?(@code)
        return nil
      else
        (@ic.iconv(doc.css('#CollapsiblePanel1_People tr:nth-child(26) .category_data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
      end
    end

    def sex_ratio
      if ['ee', 'xx'].include?(@code)
        (@ic.iconv(doc.css('#CollapsiblePanel1_People tr:nth-child(23) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
      else
        (@ic.iconv(doc.css('#CollapsiblePanel1_People tr:nth-child(29) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
      end
    end

    def infant_mortality
      if ['ee', 'xx'].include?(@code)
        (@ic.iconv(doc.css('#CollapsiblePanel1_People tr:nth-child(26) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
      else
        (@ic.iconv(doc.css('#CollapsiblePanel1_People tr:nth-child(32) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
      end
    end

    def life_expectancy
      if ['ee', 'xx'].include?(@code)
        (@ic.iconv(doc.css('#CollapsiblePanel1_People tr:nth-child(29) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
      else
        (@ic.iconv(doc.css('#CollapsiblePanel1_People tr:nth-child(35) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
      end
    end

    def fertility_rate
      if ['ee', 'xx'].include?(@code)
        (@ic.iconv(doc.css('#CollapsiblePanel1_People tr:nth-child(32) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
      else
        (@ic.iconv(doc.css('#CollapsiblePanel1_People tr:nth-child(38) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
      end
    end

    def ethnic_groups
      if (@ic.iconv(doc.to_s + ' ')[0..-2]).match("Definitions and Notes: Major infectious diseases")
        (@ic.iconv(doc.css('#CollapsiblePanel1_People tr:nth-child(62) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip        
      elsif ['ee', 'xx'].include?(@code)
        return nil
      else
        (@ic.iconv(doc.css('#CollapsiblePanel1_People tr:nth-child(59) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
      end
    end

    def religions
      if (@ic.iconv(doc.to_s + ' ')[0..-2]).match("Definitions and Notes: Major infectious diseases")
        (@ic.iconv(doc.css('#CollapsiblePanel1_People tr:nth-child(65) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
      elsif ['xx'].include?(@code)
        (@ic.iconv(doc.css('#CollapsiblePanel1_People tr:nth-child(50) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
      elsif ['ee'].include?(@code)
        (@ic.iconv(doc.css('#CollapsiblePanel1_People tr:nth-child(44) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
      else
        (@ic.iconv(doc.css('#CollapsiblePanel1_People tr:nth-child(62) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
      end
    end

    def languages
      if (@ic.iconv(doc.to_s + ' ')[0..-2]).match("Definitions and Notes: Major infectious diseases")
        (@ic.iconv(doc.css('#CollapsiblePanel1_People tr:nth-child(68) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
      elsif ['xx'].include?(@code)
        (@ic.iconv(doc.css('#CollapsiblePanel1_People tr:nth-child(53) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
      elsif ['ee'].include?(@code)
        (@ic.iconv(doc.css('#CollapsiblePanel1_People tr:nth-child(47) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
      else
        (@ic.iconv(doc.css('#CollapsiblePanel1_People tr:nth-child(65) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
      end
    end

    def literacy
      if (@ic.iconv(doc.to_s + ' ')[0..-2]).match("Definitions and Notes: Major infectious diseases")
        (@ic.iconv(doc.css('#CollapsiblePanel1_People tr:nth-child(71) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
      elsif ['xx'].include?(@code)
        (@ic.iconv(doc.css('#CollapsiblePanel1_People tr:nth-child(56) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
      elsif ['ee'].include?(@code)
        return nil
      else
        (@ic.iconv(doc.css('#CollapsiblePanel1_People tr:nth-child(68) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
      end
    end


    ## GOVERNMENT ##    

    def government_type
      (@ic.iconv(doc.css('#CollapsiblePanel1_Govt tr:nth-child(5) .category_data').text + ' ')[0..-2])
    end
    
    def capital
      (@ic.iconv(doc.css('#CollapsiblePanel1_Govt tr:nth-child(8) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def independence
      if (@ic.iconv(doc.to_s + ' ')[0..-2]).match("Definitions and Notes: Dependent areas")
        (@ic.iconv(doc.css('#CollapsiblePanel1_Govt tr:nth-child(17) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/[\r\t\n]/,'').strip
      else
        (@ic.iconv(doc.css('#CollapsiblePanel1_Govt tr:nth-child(14) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/[\r\t\n]/,'').strip
      end
    end

    def legal
      if (@ic.iconv(doc.to_s + ' ')[0..-2]).match("Definitions and Notes: Dependent areas")
        (@ic.iconv(doc.css('#CollapsiblePanel1_Govt tr:nth-child(26) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/[\r\t\n]/,'').strip
      else
        (@ic.iconv(doc.css('#CollapsiblePanel1_Govt tr:nth-child(23) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/[\r\t\n]/,'').strip
      end
    end

    def executive
      if (@ic.iconv(doc.to_s + ' ')[0..-2]).match("Definitions and Notes: Dependent areas")
        (@ic.iconv(doc.css('#CollapsiblePanel1_Govt tr:nth-child(35) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/[\r\t\n]/,'').strip
      else
        (@ic.iconv(doc.css('#CollapsiblePanel1_Govt tr:nth-child(32) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/[\r\t\n]/,'').strip
      end
    end

    def legislative
      if (@ic.iconv(doc.to_s + ' ')[0..-2]).match("Definitions and Notes: Dependent areas")
        (@ic.iconv(doc.css('#CollapsiblePanel1_Govt tr:nth-child(38) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/[\r\t\n]/,'').strip
      else
        (@ic.iconv(doc.css('#CollapsiblePanel1_Govt tr:nth-child(35) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/[\r\t\n]/,'').strip
      end
    end

    def judicial
      if (@ic.iconv(doc.to_s + ' ')[0..-2]).match("Definitions and Notes: Dependent areas")
        (@ic.iconv(doc.css('#CollapsiblePanel1_Govt tr:nth-child(41) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/[\r\t\n]/,'').strip
      else
        (@ic.iconv(doc.css('#CollapsiblePanel1_Govt tr:nth-child(38) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/[\r\t\n]/,'').strip
      end
    end


    def political
      if (@ic.iconv(doc.to_s + ' ')[0..-2]).match("Definitions and Notes: Dependent areas")
        (@ic.iconv(doc.css('#CollapsiblePanel1_Govt tr:nth-child(44) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/[\r\t\n]/,'').strip
      else
        (@ic.iconv(doc.css('#CollapsiblePanel1_Govt tr:nth-child(41) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/[\r\t\n]/,'').strip
      end
    end

    def flag_description
      if (@ic.iconv(doc.to_s + ' ')[0..-2]).match("Definitions and Notes: Dependent areas")
        (@ic.iconv(doc.css('#CollapsiblePanel1_Govt tr:nth-child(53) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/[\r\t\n]/,'').strip
      else
        (@ic.iconv(doc.css('#CollapsiblePanel1_Govt tr:nth-child(50) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/[\r\t\n]/,'').strip
      end
    end

    def national_symbols
      if (@ic.iconv(doc.to_s + ' ')[0..-2]).match("Definitions and Notes: Dependent areas")
         (@ic.iconv(doc.css('#CollapsiblePanel1_Govt tr:nth-child(56) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/[\r\t\n]/,'').strip
       else
         (@ic.iconv(doc.css('#CollapsiblePanel1_Govt tr:nth-child(53) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/[\r\t\n]/,'').strip
       end
     end

    def national_anthem
      if (@ic.iconv(doc.to_s + ' ')[0..-2]).match("Definitions and Notes: Dependent areas")
         (@ic.iconv(doc.css('#CollapsiblePanel1_Govt tr:nth-child(59) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/[\r\t\n]/,'').strip
       else
         (@ic.iconv(doc.css('#CollapsiblePanel1_Govt tr:nth-child(56) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/[\r\t\n]/,'').strip
       end
    end

    ## ECONOMY ##    

    def economy_overview 
      (@ic.iconv(doc.css('#CollapsiblePanel1_Econ tr:nth-child(2) .category_data').text + ' ')[0..-2])
    end

    def gdp
      (@ic.iconv(doc.css('#CollapsiblePanel1_Econ tr:nth-child(8) .category_data').text + ' ')[0..-2])
    end

    def gdp_ppp
      (@ic.iconv(doc.css('#CollapsiblePanel1_Econ tr:nth-child(5) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def gdp_growth
      (@ic.iconv(doc.css('#CollapsiblePanel1_Econ tr:nth-child(11) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def gdp_capita
      (@ic.iconv(doc.css('#CollapsiblePanel1_Econ tr:nth-child(14) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def gdp_sectors
      (@ic.iconv(doc.css('#CollapsiblePanel1_Econ tr:nth-child(17) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def labor 
      (@ic.iconv(doc.css('#CollapsiblePanel1_Econ tr:nth-child(20) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def unemployment 
      (@ic.iconv(doc.css('#CollapsiblePanel1_Econ tr:nth-child(26) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def inflation 
      (@ic.iconv(doc.css('#CollapsiblePanel1_Econ tr:nth-child(47) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def markets
      (@ic.iconv(doc.css('#CollapsiblePanel1_Econ tr:nth-child(65) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def exports 
      (@ic.iconv(doc.css('#CollapsiblePanel1_Econ tr:nth-child(122) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def imports 
      (@ic.iconv(doc.css('#CollapsiblePanel1_Econ tr:nth-child(131) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def debt
      (@ic.iconv(doc.css('#CollapsiblePanel1_Econ tr:nth-child(143) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def military
      (@ic.iconv(doc.css('#CollapsiblePanel1_Military tr:nth-child(17) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end


    ## COMMUNICATIONS ##    

    def telephones
      (@ic.iconv(doc.css('#CollapsiblePanel1_Comm tr:nth-child(2) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def cellphones
      (@ic.iconv(doc.css('#CollapsiblePanel1_Comm tr:nth-child(5) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def internet_users
      if @code == 'xx'
        (@ic.iconv(doc.css('#CollapsiblePanel1_Comm tr:nth-child(11) .category_data').text + ' ')[0..-2]).squeeze(' ').gsub(/[\r\t\n]/,'').squeeze(' ').strip        
      elsif @code == 'ee'
        (@ic.iconv(doc.css('#CollapsiblePanel1_Comm tr:nth-child(17) .category_data').text + ' ')[0..-2]).squeeze(' ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
      else
        (@ic.iconv(doc.css('#CollapsiblePanel1_Comm tr:nth-child(20) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
      end
    end

    def internet_hosts
      (@ic.iconv(doc.css('#CollapsiblePanel1_Comm tr:nth-child(17) #data').text + ' ')[0..-2]).squeeze(' ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end


    ## GLOBAL ISSUES ##    

    def disputes
      (@ic.iconv(doc.css('#CollapsiblePanel1_Issues tr:nth-child(2) .category_data').text + ' ')[0..-2])
    end

    def refugees
      (@ic.iconv(doc.css('#CollapsiblePanel1_Issues tr:nth-child(5) .category_data').text + ' ')[0..-2])
    end

    def drugs
      (@ic.iconv(doc.css('#CollapsiblePanel1_Issues tr:nth-child(8) .category_data').text + ' ')[0..-2])
    end


    private

    def doc
      @document ||= Nokogiri::HTML(open("#{@wfb_location}/geos/#{@code}.html"))
    end    
  end

end

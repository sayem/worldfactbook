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


    #############
    # GEOGRAPHY #
    #############

    def location
      doc.css('#CollapsiblePanel1_Geo tr:nth-child(2) .category_data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def area
      doc.css('#CollapsiblePanel1_Geo tr:nth-child(11) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def area_comparative
      doc.css('#CollapsiblePanel1_Geo tr:nth-child(14) .category_data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def climate
      doc.css('#CollapsiblePanel1_Geo tr:nth-child(26) .category_data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def terrain
      doc.css('#CollapsiblePanel1_Geo tr:nth-child(29) .category_data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def elevation
      doc.css('#CollapsiblePanel1_Geo tr:nth-child(32) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def natural_resources
      doc.css('#CollapsiblePanel1_Geo tr:nth-child(35) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end


    ##########
    # PEOPLE #
    ##########

    def population
      doc.css('#CollapsiblePanel1_People tr:nth-child(2) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def age_structure
      doc.css('#CollapsiblePanel1_People tr:nth-child(5) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def median_age
      doc.css('#CollapsiblePanel1_People tr:nth-child(8) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def population_growth
      doc.css('#CollapsiblePanel1_People tr:nth-child(11) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def birth_rate
      doc.css('#CollapsiblePanel1_People tr:nth-child(14) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def death_rate
      doc.css('#CollapsiblePanel1_People tr:nth-child(17) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
    end

    def net_migration
      doc.css('#CollapsiblePanel1_People tr:nth-child(20) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
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
      doc.css('#CollapsiblePanel1_People tr:nth-child(38) #data').text.squeeze(' ').gsub(/ \n \n /,'; ').gsub(/[\r\t\n]/,'').squeeze(' ').strip
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





    private

    def doc
      @document ||= Nokogiri::HTML(open("http://rubyworldfactbook.com/geos/#{@code}.html"))
    end    
  end

end

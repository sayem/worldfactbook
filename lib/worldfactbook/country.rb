module Worldfactbook

  class Country
    attr_accessor :country

    def initialize(country)
      @country = country.downcase
      @code = CountryCode.new(@country).code
    end

    def flag
      doc.css('.flag_border')
    end

    private

    def doc
      @document ||= Nokogiri::HTML(open("http://rubyworldfactbook.com/geos/#{@code}.html"))
    end    
  end

end

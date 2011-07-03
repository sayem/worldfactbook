
require 'open-uri'
require 'nokogiri'
doc = Nokogiri::HTML(open("https://www.cia.gov/library/publications/the-world-factbook/geos/us.html"))


# base = https://www.cia.gov/library/publications/the-world-factbook/geos/
# flag = doc.css('.flag_border')
# map_location = doc.css('#region-content td tr:nth-child(2) td:nth-child(2) img:nth-child(1)')
# map_world = doc.css('#noa_smmapborder')


# INTRODUCTION
# intro = doc.css('#CollapsiblePanel1_Intro #data .category_data')


# GEOGRAPHY
# location = doc.css('#CollapsiblePanel1_Geo tr:nth-child(2) .category_data')
# coordinates = doc.css('#CollapsiblePanel1_Geo tr:nth-child(5) .category_data')
# area = doc.css('#CollapsiblePanel1_Geo tr:nth-child(11) #data')
# area_comparative = doc.css('#CollapsiblePanel1_Geo tr:nth-child(14) .category_data')
# boundaries = doc.css('#CollapsiblePanel1_Geo tr:nth-child(17) #data')
# coastline = doc.css('#CollapsiblePanel1_Geo tr:nth-child(20) .category_data')
# maritime_claims = doc.css('#CollapsiblePanel1_Geo tr:nth-child(23) #data')
# climate = doc.css('#CollapsiblePanel1_Geo tr:nth-child(26) .category_data')
# elevation = doc.css('#CollapsiblePanel1_Geo tr:nth-child(32) #data')
# natural_resources = doc.css('#CollapsiblePanel1_Geo tr:nth-child(35) #data')
# land_use = doc.css('#CollapsiblePanel1_Geo tr:nth-child(35) #data')
# irrigated_land = doc.css('#CollapsiblePanel1_Geo tr:nth-child(41) .category_data')
# renewable_water = doc.css('#CollapsiblePanel1_Geo tr:nth-child(44) .category_data')
# freshwater = doc.css('#CollapsiblePanel1_Geo tr:nth-child(47) #data')
# natural_hazards = doc.css('#CollapsiblePanel1_Geo tr:nth-child(50) #data')
# environment_issues = doc.css('#CollapsiblePanel1_Geo tr:nth-child(53) .category_data')
# environment_international = doc.css('#CollapsiblePanel1_Geo tr:nth-child(56) #data')
# geography_note = doc.css('#CollapsiblePanel1_Geo tr:nth-child(59) .category_data')

# PEOPLE
# population = doc.css('#CollapsiblePanel1_People tr:nth-child(2) #data')





require 'open-uri'
require 'nokogiri'
doc = Nokogiri::HTML(open("http://rubyworldfactbook.com/geos/us.html"))


# flag = doc.css('.flag_border')
# map_location = doc.css('#region-content td tr:nth-child(2) td:nth-child(2) img:nth-child(1)')
# map_world = doc.css('#noa_smmapborder')
# intro = doc.css('#CollapsiblePanel1_Intro #data .category_data')


# GEOGRAPHY

# location = doc.css('#CollapsiblePanel1_Geo tr:nth-child(2) .category_data')
# area = doc.css('#CollapsiblePanel1_Geo tr:nth-child(11) #data')
# area_comparative = doc.css('#CollapsiblePanel1_Geo tr:nth-child(14) .category_data')
# climate = doc.css('#CollapsiblePanel1_Geo tr:nth-child(26) .category_data')
# terrain = doc.css('#CollapsiblePanel1_Geo tr:nth-child(29) .category_data')
# elevation = doc.css('#CollapsiblePanel1_Geo tr:nth-child(32) #data')
# natural_resources = doc.css('#CollapsiblePanel1_Geo tr:nth-child(35) #data')


# PEOPLE

# population = doc.css('#CollapsiblePanel1_People tr:nth-child(2) #data')
# age_structure = doc.css('#CollapsiblePanel1_People tr:nth-child(5) #data')
# median_age = doc.css('#CollapsiblePanel1_People tr:nth-child(8) #data')
# population_growth = doc.css('#CollapsiblePanel1_People tr:nth-child(11) #data')
# birth_rate = doc.css('#CollapsiblePanel1_People tr:nth-child(14) #data')
# death_rate = doc.css('#CollapsiblePanel1_People tr:nth-child(17) #data')
# net_migration = doc.css('#CollapsiblePanel1_People tr:nth-child(20) #data')
# urbanization = doc.css('#CollapsiblePanel1_People tr:nth-child(23) #data')
# major_cities = doc.css('#CollapsiblePanel1_People tr:nth-child(26) .category_data')
# sex_ratio = doc.css('#CollapsiblePanel1_People tr:nth-child(29) #data')
# infant_mortality = doc.css('#CollapsiblePanel1_People tr:nth-child(32) #data')
# life_expectancy = doc.css('#CollapsiblePanel1_People tr:nth-child(35) #data')
# fertility_rate = doc.css('#CollapsiblePanel1_People tr:nth-child(38) #data')
# ethnic_groups = doc.css('#CollapsiblePanel1_People tr:nth-child(59) #data')
# religions = doc.css('#CollapsiblePanel1_People tr:nth-child(62) #data')
# languages = doc.css('#CollapsiblePanel1_People tr:nth-child(65) #data')
# literacy = doc.css('#CollapsiblePanel1_People tr:nth-child(68) #data')



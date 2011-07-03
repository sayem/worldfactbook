
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
# terrain = doc.css('#CollapsiblePanel1_Geo tr:nth-child(29) .category_data')
# elevation = doc.css('#CollapsiblePanel1_Geo tr:nth-child(32) #data')
# natural_resources = doc.css('#CollapsiblePanel1_Geo tr:nth-child(35) #data')
# land_use = doc.css('#CollapsiblePanel1_Geo tr:nth-child(38) #data')
# irrigated_land = doc.css('#CollapsiblePanel1_Geo tr:nth-child(41) .category_data')
# renewable_water = doc.css('#CollapsiblePanel1_Geo tr:nth-child(44) .category_data')
# freshwater = doc.css('#CollapsiblePanel1_Geo tr:nth-child(47) #data')
# natural_hazards = doc.css('#CollapsiblePanel1_Geo tr:nth-child(50) #data')
# environment_issues = doc.css('#CollapsiblePanel1_Geo tr:nth-child(53) .category_data')
# environment_international = doc.css('#CollapsiblePanel1_Geo tr:nth-child(56) #data')
# geography_note = doc.css('#CollapsiblePanel1_Geo tr:nth-child(59) .category_data')


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
# hiv_prevalence = doc.css('#CollapsiblePanel1_People tr:nth-child(41) #data')
# hiv_people = doc.css('#CollapsiblePanel1_People tr:nth-child(44) #data')
# hiv_deaths = doc.css('#CollapsiblePanel1_People tr:nth-child(47) #data')
# drinking_water = doc.css('#CollapsiblePanel1_People tr:nth-child(50) #data')
# sanitation = doc.css('#CollapsiblePanel1_People tr:nth-child(53) #data')
# nationality = doc.css('#CollapsiblePanel1_People tr:nth-child(56) #data')
# ethnic_groups = doc.css('#CollapsiblePanel1_People tr:nth-child(59) #data')
# religions = doc.css('#CollapsiblePanel1_People tr:nth-child(62) #data')
# languages = doc.css('#CollapsiblePanel1_People tr:nth-child(65) #data')
# literacy = doc.css('#CollapsiblePanel1_People tr:nth-child(68) #data')
# school_expectancy = doc.css('#CollapsiblePanel1_People tr:nth-child(71) #data')
# education_exp = doc.css('#CollapsiblePanel1_People tr:nth-child(74) #data')


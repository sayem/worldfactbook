
require 'open-uri'
require 'nokogiri'
doc = Nokogiri::HTML(open("http://rubyworldfactbook.com/geos/ch.html"))


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


# GOVERNMENT

# government = doc.css('#CollapsiblePanel1_Govt tr:nth-child(5) .category_data')
# capital = doc.css('#CollapsiblePanel1_Govt tr:nth-child(8) #data')
# independence = doc.css('#CollapsiblePanel1_Govt tr:nth-child(17) #data')

# legal = doc.css('#CollapsiblePanel1_Govt tr:nth-child(26) #data')

# executive = doc.css('#CollapsiblePanel1_Govt tr:nth-child(35) #data')
# legislative = doc.css('#CollapsiblePanel1_Govt tr:nth-child(38) #data')
# judicial = doc.css('#CollapsiblePanel1_Govt tr:nth-child(41) #data')
# political = doc.css('#CollapsiblePanel1_Govt tr:nth-child(44) #data')


# ECONOMY

# economy = doc.css('#CollapsiblePanel1_Econ tr:nth-child(2) .category_data')
# gdp_ppp = doc.css('#CollapsiblePanel1_Econ tr:nth-child(5) #data')
# gdp = doc.css('#CollapsiblePanel1_Econ tr:nth-child(8) .category_data')
# gdp_growth = doc.css('#CollapsiblePanel1_Econ tr:nth-child(11) #data')
# gdp_capita = doc.css('#CollapsiblePanel1_Econ tr:nth-child(14) #data')
# gdp_sectors = doc.css('#CollapsiblePanel1_Econ tr:nth-child(17) #data')
# labor = doc.css('#CollapsiblePanel1_Econ tr:nth-child(20) #data')

# unemployment = doc.css('#CollapsiblePanel1_Econ tr:nth-child(26) #data')

# inflation = doc.css('#CollapsiblePanel1_Econ tr:nth-child(47) #data')

# markets = doc.css('#CollapsiblePanel1_Econ tr:nth-child(65) #data')

# exports = doc.css('#CollapsiblePanel1_Econ tr:nth-child(122) #data')

# imports = doc.css('#CollapsiblePanel1_Econ tr:nth-child(131) #data')

# debt = doc.css('#CollapsiblePanel1_Econ tr:nth-child(143) #data')

# military = doc.css('#CollapsiblePanel1_Military tr:nth-child(17) #data')


# COMMUNICATIONS

# telephones = doc.css('#CollapsiblePanel1_Comm tr:nth-child(2) #data')
# cellphones = doc.css('#CollapsiblePanel1_Comm tr:nth-child(5) #data')
# internet_hosts = doc.css('#CollapsiblePanel1_Comm tr:nth-child(17) #data')
# internet_users = doc.css('#CollapsiblePanel1_Comm tr:nth-child(20) #data')


# TRANSNATIONAL

# disputes = doc.css('#CollapsiblePanel1_Issues tr:nth-child(2) .category_data')
# refugees = doc.css('#CollapsiblePanel1_Issues tr:nth-child(5) .category_data')
# drugs = doc.css('#CollapsiblePanel1_Issues tr:nth-child(8) .category_data')

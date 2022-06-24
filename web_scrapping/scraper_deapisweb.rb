#!/usr/bin/env ruby
require 'nokogiri'
require 'httparty'

def scrapper

	url = "https://developer.mozilla.org/en-US/docs/Web/API"
  unparsed = HTTParty.get(url)
  parsed = Nokogiri::HTML(unparsed.body)
	
	############ ENUM ELEMENTS #
	apis_list = parsed.css('div.section-content')
  apis_list = apis_list.css('li')
  count_apis = apis_list.count
	count_apis = count_apis.to_i
	counter = 0

	############ GET DATA #
	while counter <= count_apis
		byurl = apis_list.css("a")[counter]["href"]
		element_url = "https://developer.mozilla.org#{byurl}"
		apis_unparsed = HTTParty.get(element_url)
		apis_parsed = Nokogiri::HTML(apis_unparsed.body)
		apis_container = apis_parsed.css('div.section-content')
		apis_description = apis_container.css('p')
	
		############ MODEL #
		apis = {
			api_id: counter+1,
			name: apis_parsed.css('h1').text,
			description: apis_description.text,
			example: "",
			url: element_url
		}		
		coma = [",", ",", ",", ",", " "]
		coma_counter = 0
	
		############ OUTPUT #
		puts "{"
		apis.each do |llave, valor|
			valor = "#{valor}".gsub("\n","\\n")
			valor = "#{valor}".gsub("\t","\\t")
			valor = "#{valor}".gsub("   ", " ")
			puts "\t\"#{llave}\": \"#{valor}\"#{coma[coma_counter]}"
			coma_counter += 1
		end
		puts "},"
		# OUTPUT ############
	
		counter += 1
	end
end

# EXECUTE METOD SCRAPPER
scrapper

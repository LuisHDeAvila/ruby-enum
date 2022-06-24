#!/usr/bin/env ruby
# Author: eleAche
require 'nokogiri'
require 'httparty'

# Crear una base de datos de "patrones de diseno" para interfaces de usuario.
def scrapper

	# Contenido objetivo
	url = "https://ui-patterns.com/patterns/"
	unparsed = HTTParty.get(url)
	parsed = Nokogiri::HTML(unparsed.body)
	patternslisting = parsed.css('div.categories')
	patterns_byelement = patternslisting.css('li[class]')
	count_patterns = patterns_byelement.count
	count_patterns = count_patterns.to_i
	counter = 0
	puts "["
	while counter <= count_patterns
		byurl = patterns_byelement.css('a')[counter]['href']
		pattern_url = "https://ui-patterns.com#{byurl}"
		patt_unparsed = HTTParty.get(pattern_url)

		patt_parsed = Nokogiri::HTML(patt_unparsed.body)
		patt_container = patt_parsed.css('div.container')
		patt_divpattern = patt_container.css('div.copy')

		# Este es el modelo que se busca
		patterns = {
			pattern_id: counter+1,
			pattern: patt_parsed.css('title').text.gsub(" design pattern",""),
			pattern_header: patt_container.css('div.copy').first.text,
			pattern_usage: patt_container.css('div.copy ul').first.text,
			description: patt_container.css('div.design_pattern p').text,
			url: pattern_url
		}
		coma = [",", "," ,"," ,",", ",", ""]
		coma_counter = 0
		puts "{"
		# imprime cada patron
		patterns.each do |llave, valor|
			valor = "#{valor}".gsub("\n","\\n")
			valor = "#{valor}".gsub("\t","\\t")
			valor = "#{valor}".gsub("   ", " ")
			puts "\t\"#{llave}\": \"#{valor}\"#{coma[coma_counter]}"
			coma_counter += 1
		end
		puts "},"
		counter += 1
	end
	puts "]"
end

# ejecuta el metodo scrapper
scrapper

#!/usr/bin/env ruby
require 'nokogiri'
require 'httparty'

def scrapper
  url = "https://es.javascript.info/"
  unparsed = HTTParty.get(url)
  parsed = Nokogiri::HTML(unparsed.body)
  docs_list = parsed.css('li.list-sub__item')
  count_docs = docs_list.count
	count_docs = count_docs.to_i

  counter = 0

  while counter <= count_docs
		byurl = docs_list.css("a")[counter]["href"]
		element_url = "https://es.javascript.info#{byurl}"
		docs_unparsed = HTTParty.get(element_url)
		docs_parsed = Nokogiri::HTML(docs_unparsed.body)
		docs_container = docs_parsed.css('div.content')
		docs_description = docs_container.css('p').first

		############ MODELO #
		docs = {
			docs_id: counter+1,
			name: docs_parsed.css('h1.main__header-title').text,
      description: docs_description.text,
			content: docs_container.text,
			url: element_url
		}		
		
		coma = [",", ",", ",", ",", " "]
		coma_counter = 0
		
		######################## OUTPUT #
		puts "{"
		docs.each do |k, v|
			valor = "#{v}".gsub("\n","\\n")
			valor = "#{v}".gsub("\t","\\t")
			valor = "#{v}".gsub("   ", " ")
			puts "\t\"#{k}\": \"#{v}\"#{coma[coma_counter]}"
			coma_counter += 1
		end
		puts "},"
		# OUTPUT ########################
		counter += 1
	end
end
scrapper
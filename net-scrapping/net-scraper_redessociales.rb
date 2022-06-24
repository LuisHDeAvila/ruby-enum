#!/usr/bin/env ruby
require 'net/http'
require 'uri'

# todo sea por la data
def netscrapper
  url = ""
  spider = Net::HTTP.get(URI.parse(url))
  crawler = URI.extract(spider, ["http", "https"])
  puts spider
  puts crawler
end

# Main
netscrapper
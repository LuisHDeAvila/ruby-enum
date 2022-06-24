#!/usr/bin/env ruby
require 'net/http'
require 'uri'

def netscrapper
  url = "http://api.worldbank.org/v2/sources"
  spider = Net::HTTP.get(URI.parse(url))
  crawler = URI.extract(spider, ["http", "https", "wb"])
  puts spider
  puts crawler
end
netscrapper
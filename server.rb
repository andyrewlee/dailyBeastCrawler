require 'nokogiri'
require 'open-uri'
require 'sinatra'
require 'json'

get '/titles' do
  url = "http://www.thedailybeast.com/cheats.html"
  page = Nokogiri::HTML(open(url))
  content = page.css('h3').collect{ |node| node.text }
  content.to_json
end

get '/links' do
  url = "http://www.thedailybeast.com/cheats.html"
  page = Nokogiri::HTML(open(url))
  content = page.css('.storyList a').collect{ |node| node["href"] }
  content.to_json
end

get '/*' do
  url = "http://www.thedailybeast.com/" + params[:splat][0]
  page = Nokogiri::HTML(open(url))
  content = page.css('.cheat-body-content p').collect{ |node| node.text }
  content.to_json
end

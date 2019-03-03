require 'watir'
require 'nokogiri'

memes = ["Cat Memes", "Trump Memes", "Funny Putin", "covfefe"]
browser = Watir::Browser.new(:chrome)

memes_images = memes.map do |meme|
  browser.goto("images.google.com")
  browser.text_field(title:"Search").set meme
  # browser.button(type:"submit").click
  browser.send_keys :enter
  sleep 1
  doc = Nokogiri::HTML.parse(browser.html)
  doc.at_css("div#ires img")["src"]
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'faker'
require 'open-uri'
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 5.times do
#   user = User.new(email: Faker::Internet.email, password: Faker::Internet.password(min_length = 8, max_length = 16, mix_case = true, special_chars = false))
#   user.save
# end
# puts User.all

@url = 'https://www.editions-delcourt.fr/bd/liste-des-collections-bd/humour-de-rire.html'
@html_file = open(@url).read
@html_doc = Nokogiri::HTML(@html_file)

@html_doc.search('.thumb img')['src'].first do |element|
  puts element
end

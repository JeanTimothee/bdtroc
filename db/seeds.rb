# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'faker'
require 'open-uri'
require 'nokogiri'
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  user = User.new(email: Faker::Internet.email, password: '12345test')
  user.save
end
puts User.all


@b1 = Book.new(name: 'Petit traité de Vélosophie', cover_url: 'https://www.editions-delcourt.fr/images/couvertures/petitTraiteDeVelosophie.jpg', illustrator: 'Tronchet', scenarist: 'Tronchet', description: 'Cycliste convaincu et baladeur invétéré depuis l’enfance, Didier Tronchet fait l’apologie du vélo et de ses bienfaits sur l’humanité. 54 planches d’humour bon enfant et un tantinet provocateur.', user_id: rand(6))
@b1.save

@b2 = Book.new(name: "Donjon Antipodes -10000. L'Armée du crâne", cover_url: 'https://www.editions-delcourt.fr/images/couvertures/donjonAntipodes10.000.jpg', illustrator: 'PANACCIONE Grégory', scenarist: 'SFAR Joann', description: 'Après avoir conclu la méta-histoire de Donjon  avec les tomes 110 et 111 en 2014, Sfar et Trondheim offre un nouveau souffle à leur saga culte. Un grand retour qui débute avec la création d’une série aux « antipodes » des précédents.', user_id: rand(6))
@b2.save

@b3 = Book.new(name: "Carnets d aventures ordinaires - L'Homme T01", cover_url: 'https://www.editions-delcourt.fr/images/couvertures/hommeT1.jpg', illustrator: 'Mademoiselle Caroline', scenarist: 'Mademoiselle Caroline', description: 'Si vous aussi vous êtes tombés sous le charme du regard malicieux de Mademoiselle Caroline, découvrez sans tarder ce premier recueil de ses Solitudes et Aventures ordinaires consacré à l’observation de son Homme…', user_id: rand(6))
@b3.save


# test seed scraping
# @url = 'https://www.editions-delcourt.fr/bd/liste-des-collections-bd/humour-de-rire.html'
# @html_file = open(@url).read
# @html_doc = Nokogiri::HTML(@html_file)
# @html_doc.search('.item .title a').each do |element|
#   @href = element.attribute('href').value
#   @url2 = "https://www.editions-delcourt.fr#{@href}"
#   @html_file2 = open(@url2).read
#   @html_doc2 = Nokogiri::HTML(@html_file2)
#   title = @html_doc2.search('.page-content .details .title')
#   @html_doc2.search('.details .metadatas')
# end


# @a = []
# @html_doc.search('.thumb img').each do |element|
#   src = element.attribute('src').value
#   url2 = "https://www.editions-delcourt.fr#{src}"
#   html_file2 = open(url2).read
#   html_doc2 = Nokogiri::HTML(html_file2)
#   book = Book.new(name: 'test', cover_url: url2, illustrator: 'test', scenarist: 'test', description: 'test', user_id: 1)
#   book.save
# end

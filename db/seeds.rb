require 'open-uri'
require 'nokogiri'

puts 'Destroy all Booking'
Booking.destroy_all
puts 'Destroy all Books'
Book.destroy_all
puts 'Destroy all users'
User.destroy_all
puts '>>>>>> Done!'
puts '----------------'


puts 'Create users'
@user1 = User.new(email: 'user1@gmail.com', password:'123456', address: '158 Rue Oberkampf, 75011, Paris', points: 10)
@user1.avatar.attach(io: File.open('app/assets/images/asterix-avatar.jpg'), filename: "asterix-avatar.jpg", content_type: "image/jpg")
@user1.save!

@user2 = User.create!(email: 'user2@gmail.com', password:'123456', address: '108 Rue Oberkampf, 75011 Paris', points: 10)
@user2.avatar.attach(io: File.open('app/assets/images/obelix-avatar.jpg'), filename: "obelix-avatar.jpg", content_type: "image/jpg")
@user2.save!

@user3 = User.create!(email: 'user3@gmail.com', password:'123456', address: '123 Rue Oberkampf, 75011 Paris', points: 10)
@user3.avatar.attach(io: File.open('app/assets/images/gaston-avatar.jpg'), filename: "gaston-avatar.jpg", content_type: "image/jpg")
@user3.save!

@user4 = User.create!(email: 'user4@gmail.com', password:'123456', address: '109 Rue Oberkampf, 75011 Paris', points: 10)
@user4.avatar.attach(io: File.open('app/assets/images/tintin-avatar.jpg'), filename: "tintin-avatar.jpg", content_type: "image/jpg")
@user4.save!

puts '>>>>>> Done!'
puts "#{User.count} users created!"
puts '----------------'


puts 'Create Books'

url = "https://www.editions-delcourt.fr/bd/liste-des-collections-bd/terres-de-legendes.html"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.search('.item .title a').each do |element|
  serie_url = element.attribute('href').value

  if serie_url.start_with?('/serie')
    book_url = "https://www.editions-delcourt.fr/#{serie_url}"

    html_file_book = open(book_url).read
    html_doc_book = Nokogiri::HTML(html_file_book)

    html_doc_book.search('.page-content').each do |page|
      book_title = page.search('.details .title').text
      scenarist = page.search('.metadatas li:first-child').text.split(':').last.gsub(/\s{2,}/, ' ').strip
      illustrator = page.search('.metadatas li:nth-child(2)').text.split(':').last.gsub(/\s{2,}/, ' ').strip
      description = page.search('.resume p').text
      cover_url = page.search('.visual a').attribute('href').value

      counter = 1
      previews_url = []
      if page.at_css('.visual .previews a') != nil
        4.times do
          preview = page.search(".visual .previews a:nth-child(#{counter})").attribute('href')
          preview_url = preview.value if preview
          previews_url << preview_url
          counter += 1
        end
      end

      cover_file = URI.open(cover_url)
      if cover_url.split('.').last == 'jpg' && previews_url != []
        book = Book.new(name: book_title, illustrator: illustrator, scenarist: scenarist, description: description)
        book.user = @user1
        book.cover.attach(io: cover_file, filename: "cover.jpg", content_type: 'image/jpg')

        previews_files = []
        previews_url.each_with_index do |preview_url, i|
          preview_file = URI.open(preview_url)
          preview_hash = {io: preview_file, filename: "preview#{i+1}.jpg", content_type: 'image/jpg'}
          previews_files << preview_hash
        end
        book.previews.attach(previews_files)
        book.save!
        p "#{book.name} >>> created"
      end
    end
  end
end

puts '>>>>>> Done!'
puts "#{Book.count} books created!"
puts '----------------'

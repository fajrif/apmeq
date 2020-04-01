require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
# Admin
Admin.delete_all
Admin.create(:email => "admin@apmequestrian.com", :password => "secret", :password_confirmation => "secret")

# Banner
Banner.delete_all
b = Banner.new(:caption1 => Faker::Company.catch_phrase, :caption2 => Faker::Company.catch_phrase, :link => "/about")
b.image.attach(io: Rails.root.join("app/assets/images/banners/banner1.png").open, filename: "banner1.png")
b.save

# Article
Article.delete_all
9.times do |num|
	a = Article.new(:title => Faker::Company.catch_phrase, :description => Faker::Lorem.paragraphs.join(" "))
	a.image.attach(io: Rails.root.join("app/assets/images/news/news#{num+1}.png").open, filename: "news#{num+1}.png")
	a.save
end

# Facility
Facility.delete_all
6.times do |num|
	f = Facility.new(:name => Faker::Book.title, :description => Faker::Lorem.paragraphs.join(" "))
	f.category_name = ['facility', 'livery'].sample
	f.image.attach(io: Rails.root.join("app/assets/images/facilities/facility#{num+1}.png").open, filename: "facility#{num+1}.png")
	f.save
end

# Category
Category.delete_all
Category.create(:name => "Riding")
Category.create(:name => "Farming")
Category.create(:name => "Learning")

# Horse
Horse.delete_all
def init_horse
	horse = Horse.new(:name => Faker::Creature::Horse.name, :description => Faker::Lorem.paragraphs.join(" "), :breed => Faker::Creature::Horse.breed)
	horse.sex = ['Male', 'Female'].sample
	horse.year = [ '2010', '2015', '2012', '2008' ].sample
	horse.color = ['Black', 'Brown', 'White'].sample
	horse.category = Category.all.sample
	return horse
end

# horse 1
h = init_horse
h.images.attach(io: Rails.root.join("app/assets/images/horses/horse1.png").open, filename: "horse1.png")
h.images.attach(io: Rails.root.join("app/assets/images/horses/horse11.png").open, filename: "horse11.png")
h.images.attach(io: Rails.root.join("app/assets/images/horses/horse111.png").open, filename: "horse111.png")
h.save!

# horse 2
h = init_horse
h.images.attach(io: Rails.root.join("app/assets/images/horses/horse2.png").open, filename: "horse2.png")
h.images.attach(io: Rails.root.join("app/assets/images/horses/horse22.png").open, filename: "horse22.png")
h.save!

# horse 3
h = init_horse
h.images.attach(io: Rails.root.join("app/assets/images/horses/horse3.png").open, filename: "horse3.png")
h.images.attach(io: Rails.root.join("app/assets/images/horses/horse33.png").open, filename: "horse33.png")
h.images.attach(io: Rails.root.join("app/assets/images/horses/horse333.png").open, filename: "horse333.png")
h.save!

# horse 4
h = init_horse
h.images.attach(io: Rails.root.join("app/assets/images/horses/horse4.png").open, filename: "horse4.png")
h.save!

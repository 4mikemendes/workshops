# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"


100.times do
  p User.create!(
    email: Faker::Internet.email,
    password: "123456",
    first_name: Faker::TvShows::RickAndMorty.character,
    last_name: Faker::TvShows::RickAndMorty.character,
    description: Faker::TvShows::RickAndMorty.quote
    )
end

100.times do
  file = URI.open('https://source.unsplash.com/random')
  p workshop = Workshop.create!(
    user: User.first,
    name: Faker::TvShows::RickAndMorty.character,
    workshop_description: Faker::TvShows::BigBangTheory.quote,
    location: Faker::Books::Dune.planet,
    price: Faker::Alphanumeric.alpha(number: 10),
    starting_date: Faker::Date.in_date_period,
    ending_date: Faker::Date.in_date_period
    )
  workshop.photos.attach(io: file, filename: "name.jpg")
end

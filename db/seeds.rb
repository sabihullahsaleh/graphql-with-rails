# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

5.times do
  author = Author.create(
    name: Faker::Name.name,
    date_of_birth: Faker::Date.between(from: '1900-01-01', to: '2000-01-01')
  )

  author.books << Book.create(
    title: Faker::Book.title,
    year_published: Faker::Date.between(from: '1900-01-01', to: '2022-01-01').year,
    pages: rand(100..500)
  )
end

p "created #{Author.count} authors and #{Book.count} books"

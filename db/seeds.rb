# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

DatabaseCleaner.clean_with(:truncation)

Category.create!(name: 'Electronics')
Category.create!(name: 'Videogames')
Category.create!(name: 'Board Games')

User.create!(name: 'admin',
             last_name: Faker::Name.last_name,
             nickname: Faker::LeagueOfLegends.unique.champion,
             phone_number: Faker::PhoneNumber.phone_number,
             email: 'mf_admin@mfunding.com',
             password: '123456',
             user_type: 'admin'
)
=begin
10.times do |index|
  User.create!(name: Faker::Name.first_name,
               last_name: Faker::Name.last_name,
               nickname: Faker::LeagueOfLegends.unique.champion,
               phone_number: Faker::PhoneNumber.phone_number,
               email: Faker::Internet.email,
               password: "123456",
               user_type: "generic"
               )
  Project.create!(approved_by: User.find_by(name: 'admin', user_type: 'admin').id,
                  money_goal: rand(10000..10000000),
                  finish_date: Faker::Date.forward(1000),
                  description: Faker::Lorem.sentence,
                  founded: false,
                  approval_date: Datetime.now(),
                  name: Faker::Lorem.unique.word
                  )
end
=end


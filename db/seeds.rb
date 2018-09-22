# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Topic.destroy_all

# Topic.create([
# 	{name: "Agriculture"},
# 	{name: "Arts & Culture"},
# 	{name: "Autobiographies"},
# 	{name: "Basic Sciences"},
# 	{name: "Business & Finance"},
# 	{name: "Economics"},
# 	{name: "Education"},
# 	{name: "Energy & Natural Resources"},
# 	{name: "Engineering & Industry"},
# 	{name: "Geography & Environment"},
# 	{name: "Government & Politics"},
# 	{name: "Health & Medicine"},
# 	{name: "History & Law"},
# 	{name: "Information Technology"},
# 	{name: "Media"},
# 	{name: "Sports & Recreation"},
# 	{name: "Tourism & Hospitality"}
# ])

# p "Seeded #{Topic.count} entries for Topic"

# Seed Users
point = {}
point['reference_url'] = 'https://www.placeholderurl.com/'
Point.destroy_all

ActiveRecord::Base.transaction do
  1000.times do 
    point['topic_id'] = Faker::Number.between(1, 17)
    point['user_id'] = Faker::Number.between(4, 6)
    point['name'] = Faker::Hipster.paragraph(4, true)
    point['year'] = Faker::Number.between(1950, 2018)
    point['like_admin'] = Faker::Number.between(1, 50)
    point['like_user'] = Faker::Number.between(1, 20)
    Point.create(point)
  end
end 

p "Seeded #{Point.count} entries for Point"

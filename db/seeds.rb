# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Topic.destroy_all

Topic.create([
	{name: "Agriculture"},
	{name: "Arts & Culture"},
	{name: "Autobiographies"},
	{name: "Basic Sciences"},
	{name: "Business & Finance"},
	{name: "Economics"},
	{name: "Education"},
	{name: "Energy & Natural Resources"},
	{name: "Engineering & Industry"},
	{name: "Geography & Environment"},
	{name: "Government & Politics"},
	{name: "Health & Medicine"},
	{name: "History & Law"},
	{name: "Information Technology"},
	{name: "Media"},
	{name: "Sports & Recreation"},
	{name: "Tourism & Hospitality"}
])

p "Seeded #{Topic.count} entries for Topic"

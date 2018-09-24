# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Creating Admin
User.create({first_name: "Super", last_name: "Admin", occupation: "Technopreneur", industry: "Others", email: "superadmin@gmail.com", password: 'superadmin', role: 2})

# Creating Researchers

User.create([
	{first_name: "Researcher", last_name: "1", occupation: "Researcher", industry: "Others", email: "researcher1@gmail.com", password: 'r123451', role: 1},
	{first_name: "Researcher", last_name: "2", occupation: "Researcher", industry: "Others", email: "researcher2@gmail.com", password: 'r123452', role: 1},
	{first_name: "Researcher", last_name: "3", occupation: "Researcher", industry: "Others", email: "researcher3@gmail.com", password: 'r123453', role: 1},
])

# Creating 10 Users

user = {}
user['password'] = 'test123'

for i in 0..9
    user['first_name'] = Faker::Name.first_name 
    user['last_name'] = Faker::Name.last_name
    user['email'] = "testing#{i}@gmail.com"
    User.create(user)
end

p "Seeded #{User.count} entries for User"

# Creating topics

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

# Creating Points

point = {}
point['reference_url'] = 'https://www.placeholderurl.com/'

ActiveRecord::Base.transaction do
  500.times do 
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


# Creating Projects

project = {}
# point['reference_url'] = 'https://www.placeholderurl.com/'

ActiveRecord::Base.transaction do
  20.times do 
    project['topic_id'] = Faker::Number.between(1, 17)
    project['user_id'] = Faker::Number.between(5, 14)
    project['name'] = Faker::Hipster.sentence(1)
    project['description'] = Faker::Hipster.sentence(10)
    project['pages'] = Faker::Number.between(1, 10)
    Project.create(project)
  end
end 

p "Seeded #{Project.count} entries for Project"


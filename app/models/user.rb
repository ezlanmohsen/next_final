class User < ApplicationRecord
	has_secure_password
	validates :password, presence: { on: :create }, length: { minimum: 5, allow_blank: true }
	validates :email, uniqueness: true
	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 

	OCCUPATION_LIST = [
  	'Agriculture, forestry and fishing',
  	'Mining and quarrying',
  	'Manufacturing',
  	'Construction',
  	'Wholesale and retail',
  	'Transporting and storage',
  	'Accommodation and food service',
  	'Information and communication',
  	'Financial and insurance',
  	'Real estate',
  	'Professional, scientific and technical',
  	'Administrative and support',
  	'Public administration and defence',
  	'Education',
  	'Human health and social work',
  	'Arts, entertainment and recreation',
  	'Others'
  ]
end

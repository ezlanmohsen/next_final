class Topic < ApplicationRecord

	has_many :projects
	has_many :points
	
	#validations for name
	validates :name, presence: true

end

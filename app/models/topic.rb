class Topic < ApplicationRecord

	has_many :projects
	
	#validations for name
	validates :name, presence: true

end

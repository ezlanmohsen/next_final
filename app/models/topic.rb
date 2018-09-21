class Topic < ApplicationRecord

	#validations
	validates :name, presence: true
end

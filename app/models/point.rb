class Point < ApplicationRecord
	enum status: [:Valid, :Invalid] 

    belongs_to :user
	belongs_to :topic

	#validations
	validates :user_id, presence: true
	validates :topic_id, presence: true
	validates :name, length: { minimum: 30,
    wrong_length: "Name must be more than 30 characters" }
    validates :reference_url, url: true
    validates_length_of :year, is: 4,  message: "Year must be in xxxx format" 

end

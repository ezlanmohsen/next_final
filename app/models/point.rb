class Point < ApplicationRecord
	enum status: [:Valid, :Invalid] 

    belongs_to :user
	belongs_to :topic

	#validations
	validates :user_id, presence: true
	validates :topic_id, presence: true
	validates :name, length: { minimum: 30,
    wrong_length: "Name must be more than 30 characters" }
    validates :reference_url, presence: true, format: { with: /\A^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}(:[0-9]{1,5})?(\/.*)?\z/ix, message: "Please copy paste the URL of the reference"}
    validates_length_of :year, is: 4,  message: "Year must be in xxxx format"
    validates :year, :numericality => { :greater_than_or_equal_to => 1950, message: "Must be later than 1949" }

end

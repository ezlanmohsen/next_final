class Project < ApplicationRecord
	enum status_user: [:booked, :paid, :delivered] 
	enum status_admin: [:unassigned, :queued, :assigned, :started, :completed]

    belongs_to :user
	belongs_to :topic
	has_many :assignments

	#validations
	validates :name, length: { maximum: 30, minimum: 3,
    wrong_length: "Name must be between 3 to 30 characters" }
    validates :description, length: { minimum: 50,
    wrong_length: "Description must be more than 50 characters" }
	validates :user_id, presence: true
	validates :topic_id, presence: true
end

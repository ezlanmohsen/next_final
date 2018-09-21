class Project < ApplicationRecord
	enum status_user: [:Booked, :Paid, :Delivered] 
	enum status_admin: [:Queued, :Assigned, :Started, :Completed]

    belongs_to :user
	belongs_to :topic

	#validations
	validates :name, length: { maximum: 30, minimum: 5,
    wrong_length: "Name must be between 5 to 30 characters" }
    validates :description, length: { maximum: 200, minimum: 50,
    wrong_length: "Description must be between 50 to 200 characters" }
	validates :user_id, presence: true
	validates :topic_id, presence: true
end

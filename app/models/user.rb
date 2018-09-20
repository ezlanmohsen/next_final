class User < ApplicationRecord
	has_secure_password
	validates :password, presence: { on: :create }, length: { minimum: 5, allow_blank: true }
	validates :email, uniqueness: true
	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
end

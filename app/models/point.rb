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

	#method to filter
	def self.search(form_name, form_topic, form_year, form_admin_likes)
		if (form_name != "") && (form_name != nil)
			
	      self.where("lower(name) LIKE ?", "%#{form_name.downcase}%")
	      #ANOTHER WAY TO WRITE THIS:
	      # scope :name_search,  ->(form_name) {where ("lower(name) LIKE ?", "%#{form_name.downcase}%")}
	      # then call Listing.name_search(params[:yaydaydayda])
		elsif (form_topic != "") && (form_topic != nil)
	      self.where("topic_id == ?", form_topic)	

		elsif (form_year != "") && (form_year != nil)			
	      self.where("year <= ?", form_year)

	    elsif (form_admin_likes != "") && (form_admin_likes != nil)			
	      self.where("like_admin >= ?", form_admin_likes)
	    else
	      self.all
	    end
	end

end

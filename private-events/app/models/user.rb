class User < ApplicationRecord
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
	                  format: { with: VALID_EMAIL_REGEX },
	                  uniqueness: { case_sensitive: false }

	has_many :events, foreign_key: "creator_id"
	has_many :event_setups, foreign_key: "attendees_id"
	has_many :attended_events, through: :event_setups

	# Current User
	def current_user
		@current_user = User.find_by(id: params[:id])
	end

	# Retrieve previous events
	def previous_events
		attended_events.where("date < ?", Time.now)
		#@prev_events = current_user.attended_events.where("date < ?", Time.now)
	end

	# Retrieve upcoming events
	def upcoming_events
		attended_events.where("date > ?", Time.now)
	end
end

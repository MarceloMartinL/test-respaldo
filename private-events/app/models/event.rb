class Event < ApplicationRecord
	belongs_to :creator, class_name: "User", foreign_key: "creator_id"
	has_many :event_setups, foreign_key: "attended_events_id"
	has_many :attendees, through: :event_setups

	scope :previous_events, -> { where("date < ?", Time.now)}
	scope :upcoming_events, -> { where("date > ?", Time.now)}
end

class EventSetup < ApplicationRecord

	belongs_to :attendee, class_name: "User", foreign_key: "attendees_id"
	belongs_to :attended_event, class_name: "Event", foreign_key: "attended_events_id"
end

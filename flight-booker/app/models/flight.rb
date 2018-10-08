class Flight < ApplicationRecord
	belongs_to :from_airport, class_name: "Airport", foreign_key: "start_airport_id"
	belongs_to :to_airport, class_name: "Airport", foreign_key: "finish_airport_id"
	has_many :bookings
	has_many :passengers, through: :bookings

	def self.valid_flights(start, finish, date)
		return if date.nil?
		where(start_airport_id: start, finish_airport_id: finish, date: (date.to_datetime.beginning_of_day..date.to_datetime.end_of_day))
	end
end

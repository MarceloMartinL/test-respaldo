class FlightsController < ApplicationController

	def index
		@airport_options = Airport.all.map { |u| [u.name, u.id] }
		@date_options = Flight.all.map { |f| f.date.strftime('%b %d, %Y') }.uniq
		@flight_options = Flight.valid_flights(params[:start_airport], params[:end_airport], params[:date])
	end
end

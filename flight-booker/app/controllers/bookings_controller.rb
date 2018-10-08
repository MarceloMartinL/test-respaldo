class BookingsController < ApplicationController

	def new
		@booking = Booking.new
		@flight = Flight.find(params[:flight_id])
		@total_passengers = params[:passengers].to_i
		@total_passengers.times { @booking.passengers.build }
	end

	def create
		@booking = Booking.new(booking_params)
		if @booking.save
			@booking.passengers.each do |passenger|
				PassengerMailer.thank_you(passenger).deliver_now
			end
			flash[:success] = "The flight has been booked successfully!"
			redirect_to @booking
		else
			@flight = Flight.find(params[:booking][:flight_id])
			flash.now[:danger] = "Please enter a valid name/email"
			render 'new'
		end
	end

	def show
		@booking = Booking.find(params[:id])
		@flight = @booking.flight
	end

	private

		def booking_params
			params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
		end
end

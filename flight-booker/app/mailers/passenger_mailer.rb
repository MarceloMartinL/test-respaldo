class PassengerMailer < ApplicationMailer

	def thank_you(user)
		@user = user
		@url = booking_url(user.booking, host: 'localhost:3000')
		mail(to: @user.email, subject: "Flight ticket booked")
	end
end

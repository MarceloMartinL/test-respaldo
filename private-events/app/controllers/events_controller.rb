class EventsController < ApplicationController

	def index
		@upco_events = Event.upcoming_events
		@prev_events = Event.previous_events
	end

	def show
		@event = Event.find(params[:id])
	end

	def new
		@event = Event.new
	end

	def create
		@user = User.find(session[:user_id])
		@event = @user.events.build(event_params)
		if @event.save
			flash[:success] = "The event has been created!"
			redirect_to @user
		else
			render 'new'
		end
	end

	def destroy
	end

	private

		def event_params
			params.require(:event).permit(:description, :location).merge(date: Time.now)
		end
end

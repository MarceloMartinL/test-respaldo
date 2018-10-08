class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Account created!"
			redirect_to root_url
		else
			render 'new'
		end
	end

	def show
		@upco_events = current_user.upcoming_events
		@prev_events = current_user.previous_events
	end

	private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end

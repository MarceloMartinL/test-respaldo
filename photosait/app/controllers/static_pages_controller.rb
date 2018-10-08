class StaticPagesController < ApplicationController

	def index
		@user_name = params[:user_name]
		if @user_name
			begin
				@user_id = flickr.people.findByUsername(username: @user_name)
				@list = flickr.people.getPhotos(user_id: @user_id.id)
			rescue
				@error = "Invalid User Name!" if @list.nil?
			end
		end	
	end
end

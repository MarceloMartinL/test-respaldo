class UsersController < ApplicationController

	def index
		@name = "I'm the index method!"
	end

	def show
		@name = "Show method right here!"
	end

	def edit
		@name = "Call me the edit method!"
	end

	def new
		@name = "I am the lord new method!"
	end

	def create
	end
end

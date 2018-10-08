class PostsController < ApplicationController
	before_action :logged_in_user, only: [:new, :create]

	def new
		@post = Post.new
	end

	def create
		current_user
		@post = @current_user.posts.build(title: params[:post][:title], body: params[:post][:body])

		if @post.save
			redirect_to posts_path
		else
			render 'new'
		end
	end

	def index
		@posts = Post.all
		@user = User.find_by(id: @pos)
	end

	private

		def post_params
			params.require(:post).permit(:title, :body)
		end
end

class SchoolClassesController < ApplicationController
	def index
		@classes = SchoolClass.all
	end

	def show
		@post = SchoolClass.find(params[:id])
	end

	def new
		@post = SchoolClass.new
	end

	def create
	  @post = SchoolClass.new(post_params(:title, :description))
	  @post.save
	  redirect_to post_path(@post)
	end

	def edit
		@post = SchoolClass.find(params[:id])
	end

	def update
	  @post = SchoolClass.find(params[:id])
	  @post.update(post_params(:title))
	  redirect_to post_path(@post)
	end

	private


	# We pass the permitted fields in as *args;
	# this keeps `post_params` pretty dry while
	# still allowing slightly different behavior
	# depending on the controller action
	def post_params(*args)
	  params.require(:post).permit(*args)
	end

end

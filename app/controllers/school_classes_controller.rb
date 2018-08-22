class SchoolClassesController < ApplicationController
	def index
		@classes = SchoolClass.all
	end

	def show
		@class = SchoolClass.find(params[:id])
	end

	def new
		@class = SchoolClass.new
	end

	def create
	  @class = SchoolClass.new(class_params(:title, :description))
	  @class.save
	  redirect_to class_path(@class)
	end

	def edit
		@class = SchoolClass.find(params[:id])
	end

	def update
	  @class = SchoolClass.find(params[:id])
	  @class.update(class_params(:title))
	  redirect_to class_path(@class)
	end

	private


	# We pass the permitted fields in as *args;
	# this keeps `class_params` pretty dry while
	# still allowing slightly different behavior
	# depending on the controller action
	def class_params(*args)
	  params.require(:school_class).permit(*args)
	end

end

class GalleriesController < ApplicationController
	
	def index
		@galleries = Gallery.all
	end

	def show
		@gallery = Gallery.find(params[:id])
	end

	def new
		@gallery = current_user.galleries.new
	end

	def create
		params_with_user_id = gallery_params.merge(
			user_id: current_user.id
			)
		@gallery = Gallery.new(params_with_user_id)
		if @gallery.save
			# it worked
			redirect_to @gallery
		else
			#saving failed
			render :new
		end
	end

	def edit
		#@gallery = Gallery.find(params[:id])
		@gallery = current_user.galleries.find(params[:id])
		#the_user = current_user
		#galleries

	end

	def update
		@gallery = Gallery.find(params[:id])
		if @gallery.update(gallery_params)
			redirect_to @gallery
		else
			render :edit
		end
		
	end

	def destroy
		gallery = current_user.galleries.find(params[:id])
		gallery.destroy
		redirect_to "/"
	end

	private

	def gallery_params
		params.require(:gallery).permit(
			:name,
			:description,
			)
	end



end 
class ImagesController < ApplicationController
	def new
		@gallery = Gallery.find(params[:gallery_id])
		@image = Image.new
	end

	def create
		@image = Image.new(image_params)
		@gallery = Gallery.find(params[:gallery_id])

		if @image.save
			redirect_to @gallery
		else
			render :new
		end
	end

	def edit
		@gallery = Gallery.find(params[:gallery_id])
		@image = Image.find(params[:id])
		
	end

	def update
		@gallery = Gallery.find(params[:gallery_id])
		@image = Image.find(params[:id])
		if @image.update(image_params)
			redirect_to @gallery
		else
			render :edit
		end
	end


	def destroy
		gallery = Gallery.find(params[:gallery_id])
		image = Image.find(params[:id])
		image.destroy
		redirect_to "/galleries/#{gallery.id}"
	end

	private

	def image_params
		params.
		require(:image).
		permit(:url).merge(gallery_id: params[:gallery_id])
	end


end
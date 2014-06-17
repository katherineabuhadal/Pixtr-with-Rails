class ImagesController < ApplicationController
	def new
		@gallery = Gallery.find(params[:gallery_id])
		@image = Image.new
	end

	def create
		image = Image.create(image_params)
		gallery = Gallery.find(params[:gallery_id])
		redirect_to "/galleries/#{gallery.id}"
	end



	private

	def image_params
		params.
		require(:image).
		permit(:url).merge(gallery_id: params[:gallery_id])
	end


end
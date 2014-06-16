class GalleriesController < ApplicationController
	
	def index
		@galleries = Gallery.all
	end

	def show
		@gallery = Gallery.find(params[:id])
	end

	def new
		@gallery = Gallery.new
	end

	def create
		gallery = Gallery.create(params[:gallery])
		redirect_to "/galleries/#{gallery.id}"
	end

end 
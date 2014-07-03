class TaggingsController < ApplicationController
  def show
    @tag = Tags.find(params[:id])
  end
end


class TagsController < ApplicationController
  def new
    @tag = Tag.new
  end

  def index
    @tags = Tag.all
  end

  def create
    @tag = Tag.new(tag_params)
    

    if @tag.save
        redirect_to :tags
    else
      render :new
    end
  end

  private
 def  tag_params

   params.require(:tag).permit(:name )
 end

end

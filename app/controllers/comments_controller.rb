class CommentsController < ApplicationController
 def create
   @image = Image.find(params[:image_id])
   @comment = @image.comments.create(comment_params)
   
   redirect_to @image
 
 end 

 private

 def comment_params
   params.require(:comment).permit(:body).merge(user_id: current_user.id)
 end
end

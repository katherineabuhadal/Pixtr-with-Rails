class CommentsController < ApplicationController
 def create
   @image = Image.find(params[:image_id])
   @comment = Comment.new(comment_params)
   @comment.image = @image
   
   if @comment.save
   redirect_to @image
   else
     @comments = @image.comments
     render "images/show"
   end
 
 end 

 private

 def comment_params
   params.require(:comment).permit(:body).merge(user_id: current_user.id)
 end
end

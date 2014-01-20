class CommentsController < ApplicationController
before_filter :authenticate_user!, :except => [:index, :show]

  
  def create
    @comment = current_user.comments.create(allowed_params)
  	redirect_to :back
  end
  
  
  def new
    @comment=Comment.new
  end


private
def allowed_params
  params.require(:comment).permit(:message, :user_id, :beer_id)
end


end


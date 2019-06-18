class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    byebug
    @comment = Comment.new(text: commentparams["text"], user_id: @user.id)
    @comment.save
    redirect_to shout_path(@comment.shout)
  end

  def like
    @comment = Comment.find(params[:id])
    Like.create(likeable: @comment, user_id: session[:user_id])
    redirect_to shout_path(@comment.shout)
  end

  def unlike
    @comment = Comment.find(params[:id])
    like = @comment.likes.find_by(user_id: session[:user_id])
    like.destroy
    redirect_to shout_path(@comment.shout)
  end

  private

  def commentparams
    params.require(:comment).permit(:text)
  end
end

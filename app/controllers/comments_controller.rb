class CommentsController < ApplicationController
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

  def destroy
    @comment = Comment.find(params[:id])
    @shout = @comment.shout
    @comment.destroy
    redirect_to shout_path(@shout)
  end

end

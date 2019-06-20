class CommentsController < ApplicationController
  before_action :require_login
  
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

  def hate
    @comment = Comment.find(params[:id])
    Hate.create(hateable: @comment, user_id: session[:user_id])
    redirect_to shout_path(@comment.shout)
  end

  def unhate
    @comment = Comment.find(params[:id])
    hate = @comment.hates.find_by(user_id: session[:user_id])
    hate.destroy
    redirect_to shout_path(@comment.shout)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @shout = @comment.shout
    @comment.destroy
    redirect_to shout_path(@shout)
  end

  private

  def require_login
    redirect_to login_path unless session.include? :user_id
  end

end

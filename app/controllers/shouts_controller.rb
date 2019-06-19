class ShoutsController < ApplicationController
  before_action :require_login

  def index
    @shouts = Shout.sort_and_filter params
    @user = User.find(session[:user_id])
    if params[:user_filter] && params[:user_filter].to_i != session[:user_id]
      redirect_to shouts_path
    end
  end

  def show
    @shout = Shout.find(params[:id])
    @user = User.find(session[:user_id])
  end

  def new
    @shout = Shout.new
  end

  def create
    @shout = Shout.new(text: params.require(:text), user_id: params.require(:user_id))
    @shout.save
    redirect_to shouts_path
  end

  def destroy
    @shout = Shout.find(params[:id])
    @shout.destroy
    redirect_to "/shouts"
  end

  def like
    @shout = Shout.find(params[:id])
    Like.create(likeable: @shout, user_id: session[:user_id])
    redirect_to shout_path(@shout)
  end

  def unlike
    @shout = Shout.find(params[:id])
    like = @shout.likes.find_by(user_id: session[:user_id])
    like.destroy
    redirect_to shout_path(@shout)
  end

  def likeindex
    @shout = Shout.find(params[:id])
    Like.create(likeable: @shout, user_id: session[:user_id])
    redirect_to shouts_path
  end

  def unlikeindex
    @shout = Shout.find(params[:id])
    like = @shout.likes.find_by(user_id: session[:user_id])
    like.destroy
    redirect_to shouts_path
  end

  def hate
    @shout = Shout.find(params[:id])
    Hate.create(hateable: @shout, user_id: session[:user_id])
    redirect_to shout_path(@shout)
  end

  def unhate
    @shout = Shout.find(params[:id])
    hate = @shout.hates.find_by(user_id: session[:user_id])
    hate.destroy
    redirect_to shout_path(@shout)
  end

  def hateindex
    @shout = Shout.find(params[:id])
    Hate.create(hateable: @shout, user_id: session[:user_id])
    redirect_to shouts_path
  end

  def unhateindex
    @shout = Shout.find(params[:id])
    hate = @shout.hates.find_by(user_id: session[:user_id])
    hate.destroy
    redirect_to shouts_path
  end

  def comment
    @shout = Shout.find(params[:id])
    Comment.create(text: shoutparams["text"], user_id: @user.id, shout_id: @shout.id)
    redirect_to shout_path(@shout)
  end

  def destroycomment
    byebug
  end


  private

  def shoutparams
    params.require(:shout).permit(:text)
  end

  def require_login
    redirect_to login_path unless session.include? :user_id
  end
end

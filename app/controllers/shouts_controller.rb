class ShoutsController < ApplicationController
  def index
    @shouts = Shout.all
  end

  def show
    @shout = Shout.find(params[:id])
    @user = User.find(session[:user_id])
  end

  def new
    @shout = Shout.new
  end

  def create
    @shout = Shout.new(text: shoutparams["text"], user_id: @user.id)
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
end

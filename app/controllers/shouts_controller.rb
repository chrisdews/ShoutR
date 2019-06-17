class ShoutsController < ApplicationController
  def index
    @shouts = Shout.all
  end

  def show
    @shout = Shout.find(params[:id])
  end

  def new
    @shout = Shout.new
  end

  def create
    @shout = Shout.new(shoutparams)
    @shout.save
    redirect_to shouts_path
  end

  def destroy
    @shout = Shout.find(params[:id])
    @shout.destroy
    redirect_to "/shouts"
  end

  private

  def shoutparams
    params.require(:shout).permit(:text)
  end
end

class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        # byebug
        user = User.create(user_params)
        if user.valid?
            # redirect_to new_user_path 
            # not configured yet
        else
            flash[:errors] = user.errors.full_messages
            # redirect_to new_user_path
            # not configured yet
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end

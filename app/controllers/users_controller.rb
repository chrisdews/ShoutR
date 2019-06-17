class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        # byebug
        user = User.create(user_params)
        # byebug
        if user.valid?
            redirect_to login_path 
        else
            flash[:errors] = user.errors.full_messages
            render 'new'
            # not configured yet
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :email, :date_of_birth)
    end
end

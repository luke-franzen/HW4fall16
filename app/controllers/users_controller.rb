class UsersController < ApplicationController

    def user_params
        params.require(:user).permit(:user_id, :email, :session_token)
    end

    def new
    end

    def create
        @user = User.new(user_params)
    
        if User.exists?(:user_id => @user.user_id)
            flash[:notice] = "Sorry, this User-ID is taken. Try again."
            redirect_to new_user_path
        else
            User.create_user!(user_params)
            flash[:notice] = "Welcome #{@user.user_id}. Your account has been created."
            redirect_to login_path
        end
    end
end
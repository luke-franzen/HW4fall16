class SessionsController < ApplicationController
    
    def session_params
        params.require(:user).permit(:user_id, :email)
    end

    def new
    end

    def create
        user = User.find_by(:user_id => session_params[:user_id])
        
        if !user
             flash[:notice] = "Invalid User-ID/E-Mail combination."
             redirect_to login_path
        elsif user.email != session_params[:email]
            flash[:notice] = "Invalid User-ID/E-Mail combination."
            redirect_to login_path
        else
            session[:session_token] = user.session_token
            redirect_to movies_path
        end
    end
    
    def destroy
        session[:session_token] = nil
        redirect_to movies_path
    end
end
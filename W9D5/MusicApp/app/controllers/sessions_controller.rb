class SessionsController < ApplicationController

    def create
        @user = User.find_by_credentials(params[:user][:email], params[:user][:password])

        if user
            @user.class.reset_session_token!
            session[session_token] = @user.session_token
            redirect_to users_url
        else
            flash[:error] = "Wrong username/password combo"
            render :new
        end
    end
    
    def destroy
        @user.reset_session_token!
        session[session_token] = nil
        redirect_to new_session_url 
    end
    
    
    def new
        render :new
    end
    
    
    
    
    
    
end
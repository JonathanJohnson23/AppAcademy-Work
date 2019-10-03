class SessionsController < Api::SessionsController

    def new
    end

    def create
      user = User.find_by_credentials(
         params[:user][:username],
         params[:user][:password]
      )

      if user
         login(user)
         render :root
      else
         flash.now[:errors] = ["they dont exist or you are wrong"]
         render :new
      end

    end


   def destroy 
      if current_user
         render {}
      else
         render flash[:errors] = ["no user to logout"]
      end
    end

end

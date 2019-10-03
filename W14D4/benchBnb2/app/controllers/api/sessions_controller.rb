class Api::SessionsController < ApplicationController

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
      logout
      render :root
   end

end

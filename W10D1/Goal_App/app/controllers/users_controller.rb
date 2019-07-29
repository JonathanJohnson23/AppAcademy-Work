class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user
      login(@user)
      flash[:success] = "Success"
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
      
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end

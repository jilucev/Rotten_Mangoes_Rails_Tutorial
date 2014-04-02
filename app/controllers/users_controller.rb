class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id 
      #automatically logs the user in upon signup
      redirect_to movies_path, notice: "Welcome aboard, #{@user.firstname}!"
      #this is one way to set a flash object. We're accomplishing the same thing as
      #flash.now[:notice] =
      #another way of doing this is flash.now[:alert]
    else
      render :new
    end
  end

  protected

  def user_params
    params.require(:user).permit(:email, :firstname, :password, :password_confirmation)
  end
end

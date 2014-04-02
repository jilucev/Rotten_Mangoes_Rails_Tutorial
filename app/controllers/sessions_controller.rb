class SessionsController < ApplicationController
  

  def new
    #we didn't innitiate anything in our 'new' action because we haven't instantiated anything
#this controller isn't responsible for CRUD for a model
#our create method is essentially just creating a session IF the user's password is
#correct. It assigns a user's id to the session.
  end

  def create
    user = User.find_by(email: params[:email])
    #we find the user by email

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to movies_path, notice: "Welcome back, #{user.firstname}!"
    else
      flash.now[:alert] = "Log in failed..."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to movies_path, notice: "Hasta Luego!"
  end

  #here we are simply clearing our session and redirecting
end


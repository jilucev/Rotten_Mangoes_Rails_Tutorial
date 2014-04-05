class Admin::UsersController < ApplicationController

  before_filter :check_admin

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "user deleted!"
    redirect_to admin_users_path
  end

  protected

  def user_params
    params.require(:user).permit(:email, :firstname, :password, :password_confirmation, :admin)
  end

  def check_admin
    redirect_to root_path unless current_user.admin?
  end
end

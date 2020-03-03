class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.all
  end

  def dashboard

  end

  def update
  @user = current_user
  if @user.update_attributes(current_user_params)
    flash[:notice] = "Saved...."
  else
    flash[:alert] = "Cannot Update"
  end 
  redirect_to dashboard_path
end

  def show
 @user = User.find(params[:id])
  end


  private

  def current_user_params
    params.require(:user).permit(:about, :status, :photo)

  end
end

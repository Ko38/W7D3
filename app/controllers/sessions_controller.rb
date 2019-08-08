class SessionsController < ApplicationController
  def create
    user = User.find_by_credentials(user_params[:user_name], user_params[:password])
    
    login(user)
    redirect_to users_url
  end


  def new
    render :new
  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end

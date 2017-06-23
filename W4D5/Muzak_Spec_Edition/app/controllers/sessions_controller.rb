class SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    if @user
      log_in_user!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ['user does not exit']
      render :new
    end
  end

  def destroy
    logout_user!
    redirect_to new_user_url
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end

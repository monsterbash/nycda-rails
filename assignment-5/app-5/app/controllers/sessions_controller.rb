class SessionsController < ApplicationController
  def new
  end

  def create

    @user = User.where(email: params[:email] ).first

    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      flash[:notice] = "Signed in!"
      redirect_to user_path(@user)
    else
      flash[:alert] = "Email or password is incorrect"
      redirect_to signin_path
    end

  end

  def destroy
  	session[:user_id] = nil
    redirect_to home_page_path
  end

  private
  def user_params
  	params.require(:user).
  		permit(:email, :password)
  end


end

class UsersController < ApplicationController
  def new
  end
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/organizations'
    else
      flash[:errors] = user.errors.full_messages
      redirect_to '/'
    end
  end

  def authenticate
    user = User.find_by(email: login_params[:email])
    if user.nil?
      flash[:errors] = ['User not found']
      redirect_to '/'
    elsif user.authenticate(login_params[:password])
      session[:user_id] = user.id
      redirect_to '/organizations'
    else
      flash[:errors] = ['Incorrect Password']
      redirect_to '/'
    end
end


  def logout
    reset_session
    redirect_to '/'
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])

    if @user.update(user_params)
      redirect_to '/organizations', notice: "You have successfully updated your information!"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    end
end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def login_params
    params.require(:user).permit(:email, :password)
  end
end
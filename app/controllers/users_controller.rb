class UsersController < ApplicationController
  
  def show 
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def new
    @user = User.new
  end
  
  def create 
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user 
    else
      render 'new'
    end
  end
  
  private 
  
  def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation)
  end
  
end
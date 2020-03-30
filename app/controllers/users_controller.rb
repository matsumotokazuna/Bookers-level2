class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.all
  end

  def edit
      @user = User.find(params[:id])
      if @user.id == current_user.id
      else
      redirect_to user_path(current_user.id)
      end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."      
      redirect_to user_path(current_user.id)
    else
      render action: :edit  
    end
  end

  def index
    @users = User.all
    @book = Book.new
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]
  before_action :require_logged_in?, only: [:new]

  def new
    if @current_user == nil
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
       flash[:success] = "Welcome to the Sample App!"
       # redirect_to @user
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    if current_user != @user
     redirect_to  tasks_path
    end
  end


  def destroy
    @user.destroy
    redirect_to tasks_path, notice:"ユーザーを削除しました！"
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end

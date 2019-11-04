class Admin::UsersController < ApplicationController
  before_action :admin_user, only: [:destroy, :index]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
      @users = User.all.order("created_at DESC")
    end

  def new
    if @current_user == nil
      @user = User.new
    end
  end

  def create
    @user = User.new(admin_user_params)
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
    @tasks = Task.all
    @users = User.all
  end

  def edit
  end

  def update
    if @user.update(admin_user_params)
      redirect_to admin_users_path, notice: "ブログを編集しました！"
    else
      render :edit
    end
  end

  def
    destroy
      @user.destroy
      redirect_to admin_users_path, notice:"ユーザーを削除しました！"
    end
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def admin_user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :admin)
  end

  def admin_user
    if current_user
      redirect_to error_path, notice:"管理者権限がありません！" unless current_user.admin?
    else
      redirect_to new_session_path
    end
  end

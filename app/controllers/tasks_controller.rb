class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, only: [:index]
  def index
    # binding.pry
      @users = User.all
      @user = User.find(current_user.id)
      @users = User.page(params[:page])
      @tasks = Task.where(user_id: current_user.id).page(params[:page])
      @tasks = @tasks.joins(:labels).where(labels: { id: params[:label_id] }) if params[:label_id].present?
      if  params[:sort_expired]
        @tasks = Task.order("expiration_date").page(params[:page])
      end

      if params[:priority]
        @tasks = Task.order("priority desc").page(params[:page])
      end

      if params[:task].present?
        @tasks = @tasks.search_with_title(params[:task][:title])
        if params[:task][:status].present?
          @tasks = @tasks.search_with_status(params[:task][:status])
        end
      end
  end

  def new
    @task = Task.new
    @user = User.find(current_user.id)
  end

  def create
      @task = Task.new(task_params)
      @task.user_id = current_user.id
    # end
    if @task.save
      redirect_to tasks_path, notice: "タスクを作成しました！"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: "タスクを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice:"タスクを削除しました！"
  end

  def error
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, { label_ids: [] }, :content, :expiration_date, :status, :priority)
  end

  def search_params
    params.require(:q).permit(:title, :status)
  end
end

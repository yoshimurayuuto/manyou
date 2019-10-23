class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    # @expiration_date = Task.all.order(expiration_date: :desc)
    # if params[:sort_expired]
    # #
    #   @expiration_date.sort
    # #
    # else
      @tasks = Task.all.order(created_at: :desc)
    # end
  end
  def new

    @task = Task.new

    # @expiration_date = task.Expiration_date.new
  end

  def create
    # @expiration_date = expiration_date(task_params)
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "ブログを作成しました！"
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
      redirect_to tasks_path, notice: "ブログを編集しました！"
    else
      render :edit
    end
  end
  def destroy
  @task.destroy
  redirect_to tasks_path, notice:"ブログを削除しました！"
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end
  def task_params
    params.require(:task).permit(:name, :content, :expiration_date)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end

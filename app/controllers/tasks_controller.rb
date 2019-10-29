class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all.page(params[:page])
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
  end

  def create
      @task = Task.new(task_params)
    # end
    if @task.save
      redirect_to tasks_path, notice: "ブログを作成しました！"
    else
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
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
    params.require(:task).permit(:title, :content, :expiration_date, :status, :priority)
  end

  def search_params
    params.require(:q).permit(:title, :status)
  end
end

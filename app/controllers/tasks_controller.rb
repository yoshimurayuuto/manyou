class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all;
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "ブログを作成しました！"
    else
    # 入力フォームを再描画します。
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
    params.require(:task).permit(:name, :content)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end

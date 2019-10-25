class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :top]
  # def top
  #   @contents = Content.all.order(created_at: :desc)
  #   @contents = Content.page(params[:page]).per(20)
  # end

  # def index
    # @search = Task.search(params[:q])
    # if params[:q]
    #   @search = Task.search(params[:q]) # この行を追加
    #   @tasks = @search.all(distinct: true)
    # elsif
    # params[:sort_expired]
    # @tasks = Task.all.order(expiration_date: :desc)
    # end
    # @tasks = Task.all.order(expiration_date: :desc)

    def index
      @q = Task.ransack(params[:q])
      @tasks = @q.result(distinct: true)

    end

      # @q = Task.ransack(params[:q])
      # @tasks = @q.result(distinct: true)
      # @tasks = Task.all.order(created_at: :desc)
      # # @tasks = Task.all
      #
      # # if params[:status_key]
      # # else
      # #   @tasks = Task.all
      # # end
      # # @tasks = Task.page(params[:page])
  # end


  def new

    @task = Task.new

    # @expiration_date = task.Expiration_date.new
  end

  def create


    # if @task.present?
     # @task.status == task.status.to_i
      # params[:task][:status].to_i

     # if task_params[:status].to_i
      @task = Task.new(task_params)
    # end

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
    params.require(:task).permit(:name, :title, :content, :expiration_date, :status, :priority)
  end

  def search_params
    params.require(:q).permit(:title, :status)
  end

end

class TasksController < ApplicationController

  def index
    @current_user_tasks = current_user.tasks.all
    @current_user_q = @current_user_tasks.ransack(params[:q])
    @current_user_results = @current_user_q.result(distinct: true)

    @current_department = current_user.department_id
    @current_department_tasks = Task.joins(user: :department).where(departments: {id: @current_department}).all
    @current_department_q = @current_department_tasks.ransack(params[:q])
    @current_department_results = @current_department_q.result(distinct: true)


    @q = @current_department_tasks.ransack(params[:q])
    @results = @q.result(distinct: true)
    @tasks = current_user.tasks.all

    @new_task = Task.new
    
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash = {success: 'タスクが作成されました。'}
    else
      flash = {error: '作成に失敗しました。'}
    end
    redirect_to request.referer, flash: flash
  end

  def destroy
    task = Task.find(params[:id])
    if task.destroy
      flash = {success: 'タスクが削除されました。'}
    else
      flash = {error: '削除に失敗しました。'}
    end
    redirect_to request.referer, flash: flash
  end

  def update
    task = Task.find(params[:id])
    if task.update(task_params)
      flash = {success: 'タスク内容が更新されました。'}
    else
      flash = {error: '更新に失敗しました。'}
    end
    redirect_to request.referer, flash: flash
  end

  def task_params
    params.require(:task).permit(:name, :user_id, :category_id, :client_id, :status_id, :duedate)
  end
end
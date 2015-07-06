class TasksController < ApplicationController

  before_action :set_project, only: [:show, :destroy, :toggle]

  def show
    #@user = User.find(params[:user_id])
    @user = User.find(1)
  end

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.create(task_params)
    redirect_to project_path(@project.id)
  end

  def destroy
    @task.destroy
    redirect_to project_path(params[:project_id])
  end

  def toggle
    #render nothing: true
    #@project = Project.find(params[:project_id])
    #@task.done = !@task.done
    #@task.save
    @user = User.find(params[:user_id])
    @task = Task.find(params[:id])
    @work = @user.works.create
    if request.xhr?
=begin
      if @task.done
        render partial: 'projects/complete_btn', locals: { id: @task.id, project_id: @task.project_id }
      else
        render partial: 'projects/incomplete_btn', locals: { id: @task.id, project_id: @task.project_id }
      end
=end
      #render partial: 'projects/count'
      render text: "test"
    end
  end

  private

    def task_params
      params[:task].permit(:title)
    end

    def set_project
      #@task = Task.find(params[:id])
      @task = Task.eager_load(:project).find(params[:id])
    end

end

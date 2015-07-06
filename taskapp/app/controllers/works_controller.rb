class WorksController < ApplicationController

  before_action :set_user, only: [:show, :destroy, :toggle]

  def show
  end

  def create
    render nothing: true
    if (params.has_key?(:user_id) && params.has_key?(:task_id))
      @work = Work.where('user_id = ? AND task_id = ?',
        params[:user_id], params[:task_id]).first
        #Rails.logger.debug("My object: #{@work.inspect}")
      if @work.present?
        @work.done = !@work.done
        @work.save
      else
        @user = User.find(params[:user_id])
        @work = @user.works.create(work_params)
        @work.task_id = params[:task_id]
        @work.done = !@work.done
        @work.save
      end
    end
  end

  def destroy
    @work.destroy
    redirect_to user_path(params[:user_id])
  end

  def count
    @user = User.find(params[:user_id])
    if request.xhr?
      render partial: 'users/count'
    end
  end

  def toggle
    #render nothing: true
    @user = User.find(params[:user_id])
    @task = Task.find(params[:id])
    @work = @user.works.create
    #@user.done = !@user.done
    #@user.save
    #@work = Work.where('user_id = ? AND task_id = ?', @user.id, @task.id)
    render text: "test"
  end

  private

    def work_params
      params[:work]
    end

    def set_user
      @work = Work.find(params[:id])
    end

end

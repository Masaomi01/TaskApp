class TasksController < ApplicationController
    def new

        @task = current_user.tasks.build
    end

    def create
        @task = current_user.tasks.build(task_params)
        if @task.save
          redirect_to article_path(@task), notice: '保存しました'
        else
          flash.now[:error] = '保存できません'
          render :new
        end
    end

    private
    def task_params
        params.require(:task).permit(:content, :title)
    end
end 
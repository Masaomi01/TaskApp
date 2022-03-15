class TasksController < ApplicationController
    
    
    def new
        article = Article.find(params[:article_id])
        @task = article.tasks.build
    end

    def create
        article = Article.find(params[:article_id])
        @task = article.tasks.build(task_params)
        if @task.save!
          redirect_to article_path(article), notice: '保存しました'
        else
          flash.now[:error] = '保存できません'
          render :new
        end
    end

    private
    def task_params
        params.require(:task).permit(:content, :title).merge(user_id: current_user.id)
    end
    
end 
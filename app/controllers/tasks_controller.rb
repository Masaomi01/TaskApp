class TasksController < ApplicationController


    def show
        @article = Article.find(params[:article_id])
        @task = @article.tasks.find(params[:id])
        
    end
    
    def new
        article = Article.find(params[:article_id])
        @task = article.tasks.build
    end

    def create
        article = Article.find(params[:article_id])
        @task = article.tasks.build(task_params)
        if @task.save
          redirect_to article_path(article), notice: '保存しました'
        else
          flash.now[:error] = '保存できません'
          render :new
        end
    end
    def edit
        @task = current_user.tasks.find(params[:id])
        

    end
    
    def update
        @task = current_user.tasks.find(params[:id])
        
        if @task.update(task_params)
          redirect_to article_task_path(@task.article), notice: '更新しました'
        else
          flash.now[:error] = '更新できませんでした'
          render :edit
        end
    end

   
    def destroy
        article = Article.find(params[:article_id])
        task = article.tasks.find_by(user_id: current_user.id)
        task.destroy!
        redirect_to article_path(article), notice: '削除に成功しました'
    end
    

    private
    def task_params
        params.require(:task).permit(:content, :title, :deadline, :eyecatch).merge(user_id: current_user.id)
    end
    
end 
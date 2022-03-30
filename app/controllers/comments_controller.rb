class CommentsController < ApplicationController
    def new
        task = Task.find(params[:task_id])
        @comment = task.comments.build
    end

    def create
        task = Task.find(params[:task_id])
        @comment = task.comments.build(comment_params)
        if @comment.save
            redirect_to article_task_path(@task), notice: 'コメントを作成しました'
        else
            flash.now[:error] = '更新できませんでした'
            render :new
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:content)
    end 
end
class ArticlesController < ApplicationController
    before_action :set_article, only: [:show]
    def index
        # @articles = Article.all
    end

    def show
    end

    def new
        @article = current_user.articles.build
    end
    
    def create
        @article = current_user.articles.build(article_params)
        if @article.save
          redirect_to article_path(@article), notice: '保存しました'
        else
          flash.now[:error] = '保存できません'
          render :new
        end
    end
    

      
    private

    def article_params
        params.require(:article).permit(:title, :content)
    end


    def set_article
        @article = Article.find(params[:id])
    end

end
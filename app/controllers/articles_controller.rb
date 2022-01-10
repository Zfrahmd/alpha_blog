class ArticlesController < ApplicationController
    def show
        # @ is used to make article an instance of Article
        # params[:id] are the hash parameters where id is the actual 
        # parameter to be evaluated
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end
end
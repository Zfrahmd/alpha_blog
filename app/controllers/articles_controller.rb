class ArticlesController < ApplicationController

    # show article according to their id
    def show
      # @ is used to make article an instance variable of Table
      # params[:id] are the hash parameters where id is the actual 
      # parameter to be evaluated
      @article = Article.find(params[:id])
    end

    # get all the articles
    def index
      @articles = Article.all
    end

    # display new form page for creating article
    def new
      # create instance of article
      @article = Article.new
    end

    def edit
      # find article instance to be edited and display edit form page
      @article = Article.find(params[:id])
    end

    def create
      # create new article with required fields
      @article = Article.new(params.require(:article).permit(:title, :description))
      # save artical in db
      if @article.save
        # rails helper - flash messages
        flash[:notice] = "Article was Saved Successfully"
        # on saving redirect to the page of article created
        #redirect_to article_path(@article)
        redirect_to @article
      else
        render 'new'
      end
    end

    def update
      @article = Article.find(params[:id])
      if @article.update(params.require(:article).permit(:title, :description))
        flash[:notice] = "Artical was updated successfully"
        redirect_to @article
      else
        render 'edit'
      end
    end
end
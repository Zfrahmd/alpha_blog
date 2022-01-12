class ArticlesController < ApplicationController

  before_action :find_article, only: [:show, :edit, :update, :destroy]

  # show article according to their id
  def show
    # before_action helper will run find_artcile
    # function here
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

  # find article instance to be edited and display edit form page
  def edit
    # before_action helper will run find_artcile
    # function here
  end

  def create
    # create new article with required fields
    @article = Article.new(article_params)
    # save artical in db
    if @article.save
      # rails helper - flash messages
      flash[:notice] = "Article was Saved Successfully"
      # on saving redirect to the page of article created
      #redirect_to article_path(@article)
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    # before_action helper will run find_artcile
    # function here
    if @article.update(article_params)
      flash[:notice] = "Artical was updated successfully"
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # before_action helper will run find_artcile
    # function here
    @article.destroy
    params[:id] = nil
    flash[:danger] = "Article was successfully deleted"
    redirect_to articles_path
  end
  
  # set private function
  private
  def find_article
    # @ is used to make article an instance variable of Table
    # params[:id] are the hash parameters where id is the actual 
    # parameter to be evaluated
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

end
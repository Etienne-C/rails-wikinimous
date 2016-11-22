class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(user_params)
    @article.save
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end


  def update
    @article = Article.find(params[:id])
    @article.update(user_params)
    redirect_to articles_path
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    # no need for app/views/task/destroy.html.erb
    redirect_to articles_path
  end

  private

  def user_params
    params.require(:article).permit(:title, :content)
  end

end

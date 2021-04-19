class Admin::ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.admin_id = current_admin.id
    @article.genre_id = 1
    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article.id)
    else
     @article = Article.find(params[:id])
      render :edit
    end
  end

  def destroy
  end

  private
  def article_params
     params.require(:article).permit(:title, :image, :body, :genre_id)
  end
end

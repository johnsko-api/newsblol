# require 'pry'
class Admin::ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    # binding.pry
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "You've successfully created a article!"
      redirect_to @article
    else
      flash[:alert] = @article.errors.full_messages.join(".  ")
      render "new"
    end
  end
  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
      if @article.update(article_params)
        redirect_to admin_articles_path
        flash[:success] = "You've successfully updated a article!"
      else
        render 'edit'
        flash[:alert] = @article.errors.full_messages.join(".  ")
      end
  end

  def destroy
    @article = Article.find(params[:id])
      @article.destroy
        flash[:success] = "You've successfully deleted a article!"
      redirect_to admin_articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :image)
  end
end

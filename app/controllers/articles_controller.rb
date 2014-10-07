class ArticlesController < ApplicationController
  def index
    @articles = Article.where(category: params[:category])
  end

  def show
    #@article = Article.find(params[:id]) 
  end
end

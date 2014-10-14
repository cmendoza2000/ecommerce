class ArticlesController < ApplicationController
  def index
    @articles = Article.where(category: params[:category])
  end

  def show
    #@article = Article.find(params[:id]) 
  end

  def new
    if user_signed_in?
    else
      flash[:notice] = "You need to login to publish an item"
      redirect_to new_user_session_path
    end
  end

  def create
    render :new
  end
end

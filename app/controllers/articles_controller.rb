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
    @article = Article.new(
      user_id: current_user.id,
      name: params[:name],
      category: params[:category],
      price: params[:price],
      description: params[:description] 
    )
    @article.save
    
    flash[:notice] = "Your item has been published"
    redirect_to root_path
  end
  
  def destroy
    @article = Article.find(params[:id]).destroy

    flash[:notice] = "Your article has been successfuly deleted"
    redirect_to :back
  end

  def edit
  end
end

class ArticlesController < ApplicationController
  def index
    @articles = Article.where(category: params[:category])
  end

  def show
    @article = Article.find(params[:id]) 
    @questions = Question.where(article_id: @article.id).order("created_at DESC")
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
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update_attributes(
      name: params[:name],
      category: params[:category],
      price: params[:price],
      description: params[:description]
    )
    @article.save

    flash[:notice] = "Your article has been successfuly updated"
    redirect_to user_path(id: @article.user_id)
  end

  def filter_by_category
    @category = params[:category].capitalize
    @articles = Article.where(category: params[:category])
  end

  def search
    raise params.to_json
  end

  def create_question
    @question = Question.create(
      article_id: params[:id],
      user_id: current_user.id,
      content: params[:content]
    )
    if @question.save
      redirect_to article_path(params[:id])
      flash[:notice] = "Your question has been submitted"
    else 
      flash[:error] = "There has been an error submitting your question"
    end
  end
end

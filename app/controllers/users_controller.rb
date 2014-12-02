class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_articles = Article.where(user_id: params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(
      username: params[:username],
      last_name: params[:last_name],
      gender: params[:gender],
      city: params[:city],
      zip_code: params[:zip_code],
      email: params[:email]
    )
    @user.save
    
    flash[:notice] = "Your profile has been successfuly updated"
    redirect_to edit_user_path(@user)
  end

  def destroy
    @user = User.find(params[:id]).destroy

    flash[:notice] = "Your profile has been successfuly deleted"
    redirect_to root_path
  end

  def destroy_article
    @article = Article.find(params[:id]).destroy

    flash[:notice] = "Your article has been successfuly deleted"
    redirect_to :back
  end

  def show_questions
    @questions = Question.where(user_id: params[:id])
  end

  def answer_question
    @answer = Answer.create(
      user_id: current_user.id,
      question_id: params[:id] 
    ).save
    flash[:notice] = "The question has been answered"
    redirect_to :back
  end
end

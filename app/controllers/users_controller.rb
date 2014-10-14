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
    @user.username = params[:username]
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.age = params[:age]
    @user.gender = params[:gender]
    @user.street = params[:street]
    @user.city = params[:city]
    @user.state = params[:state]
    @user.zip_code = params[:zip_code]
    @user.email = params[:email]
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
end

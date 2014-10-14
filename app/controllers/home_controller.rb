class HomeController < ApplicationController
  def index
    @articles = Article.all.limit(12)
    @categories = ["food", "fashion", "technology"]
  end
end

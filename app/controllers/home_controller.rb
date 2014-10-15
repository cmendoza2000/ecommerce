class HomeController < ApplicationController
  def index
    @articles = Article.all.limit(12)
    @categories = ["art", "food", "fashion", "home", "health",
                   "music", "sports", "techology", "travel", "vehicles"]
  end
end

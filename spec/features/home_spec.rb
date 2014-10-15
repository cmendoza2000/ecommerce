describe HomeController, :type => :feature do
  before :each do
    @article = FactoryGirl.create(:article)
    @category = @article.category
  end
  
  feature "users can filter articles by category" do
    it "filters articles by clicking a category" do
      visit root_path
      find_by_id(@category).click
      expect(current_path).to eq articles_by_category_path(@category)
      @category[0] = @category[0].upcase
      expect(page).to have_content "Category: #{@category}"
    end
  end

  feature "users can search articles" do
  end
end

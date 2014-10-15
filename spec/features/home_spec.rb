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
      expect(page).to have_content "Category: #{@category.capitalize}"
    end
  end

  feature "users can search articles" do
    it "searches and find existent articles with lowcase" do
      visit root_path
      fill_in "Search", :with => "coca cola\n"
      expect(page.status_code).to eq 200
      #expect(current_path).to eq search_results_path("coca cola") 
    end
  end
end

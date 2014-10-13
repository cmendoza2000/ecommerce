describe ArticlesController, :type => :feature do
  describe "the flow for publishing an article" do 
      
    before :each do
      @user = FactoryGirl.create(:user)
      @article = FactoryGirl.create(:article)
    end  

    def login_user
      visit new_user_session_path
      fill_in "Email", :with => @user.email
      fill_in "Password", :with => @user.password
      click_button "Log in"
    end

    scenario "before selling redirect user to login if not authenticaded" do 
      visit new_article_path
      expect(current_path).to eq new_user_session_path
    end

    scenario "create a new article" do
      login_user
      visit new_article_path
      expect(current_path).to eq new_article_path
      fill_in "Name", :with => @article.name
      fill_in "Category", :with => @article.category
      fill_in "Price", :with => @article.price
      fill_in "Description", :with => @article.description
      click_link "Publish item"
      expect(page.status_code).to eq 200
      expect(current_path).to eq new_article_path
      expect(page).to have_css "#home"
    end

  end
end

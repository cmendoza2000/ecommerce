describe ArticlesController, :type => :feature do
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

  feature "the user can publish an article" do 
    it "redirect the user to login if not authenticaded" do 
      visit new_article_path
      expect(current_path).to eq new_user_session_path
    end

    it "creates a new article" do
      login_user
      visit new_article_path
      expect(current_path).to eq new_article_path
      fill_in "Name", :with => @article.name
      fill_in "Category", :with => @article.category
      fill_in "Price", :with => @article.price
      fill_in "Description", :with => @article.description
      click_button "Publish Item"
      expect(page.status_code).to eq 200
      expect(current_path).to eq new_article_path
    end

    it "deletes an article" do
    end
  end

  feature "searching and filtering articles" do
    it "searches and finds an existent article" do
    end

    it "filters an article by its categories" do
    end
  end

  feature "buying an article" do
    it "asks a question to the owner" do
    end

    it "answers questions to other users" do 
    end

    it "adds an article to cart" do
    end

    it "checkout and confirm buy" do
    end
  end
end

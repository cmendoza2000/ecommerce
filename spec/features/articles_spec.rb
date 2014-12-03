describe ArticlesController, :type => :feature do
  before :each do
    @user = FactoryGirl.create(:user) 
    @article = FactoryGirl.create(:article)
    @question = FactoryGirl.create(:question)
    @answer = FactoryGirl.create(:answer)
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
      expect(current_path).to eq root_path
      expect(page).to have_content @article.name
    end

    it "shows my article's details from user profile" do
      login_user
      click_link @article.name 
      expect(current_path).to eq article_path(@article)
    end

    it "edits my article" do
      login_user
      click_link "Edit"
      expect(current_path).to eq edit_article_path(@article)
      fill_in "Name", :with => "Fender Guitar"
      fill_in "Category", :with => "Music"
      fill_in "Price", :with => 1000.25
      fill_in "Description", :with => "This is a great guitar to rock with"
      click_button "Save Changes"
      expect(page.status_code).to eq 200
      expect(current_path).to eq user_path(@user)
      expect(page).to have_content "Fender Guitar"
      expect(page).to have_content "This is a great guitar to rock with"
    end

    it "deletes an article" do
      login_user
      click_link "Delete Article"
      expect(page.status_code).to eq 200
      expect(current_path).to eq user_path(@user)
    end
  end

  feature "asks and answers questions" do
    it "asks questions" do
      login_user
      click_link @article.name
      fill_in "focusedInput", :with => @question.content
      click_button "Ask Question"
      expect(page).to have_content @question.content
    end

    it "answers questions" do
      login_user
      visit user_path(@user)
      click_link "Answer Questions"
      expect(current_path).to eq user_questions_path(@user)
      expect(page).to have_content @question.content
      answer_input = "question_#{@question.id}_answer"
      expect(page).to have_css "##{answer_input}"
      fill_in answer_input, :with => @answer.content
      click_button "Answer"
      expect(page).to have_content @answer.content
      visit article_path(@article)
      expect(page).to have_content @question.content
      expect(page).to have_content @answer.content
    end
  end

  feature "buying an article" do
    it "adds an article to cart" do
    end

    it "checkout and confirm buy" do
    end

    it "send an email with transaction data" do
    end
  end
end

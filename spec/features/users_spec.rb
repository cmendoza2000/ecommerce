describe UsersController, :type => :feature do 
  before :each do
    @user = FactoryGirl.create(:user)
  end

  def login_user 
    visit new_user_session_path
    fill_in "Email", :with => "capybara@email.com"
    fill_in "Password", :with => "password"
    click_button "Log in"
  end

  feature "user can access with an account" do
    it "signs me in" do 
      login_user 
      expect(page).to have_content @user.username
      expect(page).to have_content "Logout"
      expect(page).to have_no_content "Login"
    end
    
    it "signs me up" do
      visit new_user_registration_path
      fill_in "Username", :with => "rspec"
      fill_in "Email", :with => "registration@email.com"
      fill_in "Password", :with => "password"
      fill_in "Password confirmation", :with => "password"
      click_button "Sign up"
      expect(page.status_code).to eq 200
      expect(current_path).to start_with "/users/"
      expect(page).to have_content "Hello rspec"
      expect(page).to have_content "Logout"
      expect(page).to have_no_content "Register"
    end

    it "signs me out" do
      login_user
      click_link "Logout"
      expect(current_path).to eq root_path
      expect(page).to have_content "Login"
      expect(page).to have_content "Register"
      expect(page).to have_no_content "Logout"
    end

    it "recovers my password" do
      visit new_user_password_path
      fill_in "Email", :with => "capybara@email.com"
      click_button "Send me reset password instructions"
    end
    
    feature "user can watch, edit and delete his profile" do
      it "shows my profile after login" do
        login_user
        expect(page).to have_content "Hello capybara"
        expect(page).to have_content "Delete Profile"
        expect(page).to have_content "Edit Profile"
      end

      it "go to my profile" do
        login_user
        visit root_path
        click_link "Account"
        expect(current_path).to eq user_path(@user)
      end

      it "edits my profile" do
        login_user
        click_link "Edit Profile"
        fill_in "username", :with => "username2"
        fill_in "first_name", :with => "Alvaro"
        fill_in "last_name", :with => "Delgado"
        fill_in "age", :with => 28
        select "Male", :from => "gender"
        fill_in "street", :with => "First Ave. No. 1200"
        fill_in "city", :with => "Morelia"
        fill_in "state", :with => "Texas"
        fill_in "zip_code", :with => "100000"
        fill_in "email", :with => "aalvaaro@email.com"
        click_button "Save Changes"
        expect(page.status_code).to eq 200
        expect(current_path).to eq edit_user_path(@user)
      end

      it "deletes my profile" do 
        visit user_path(@user)
        click_link "Delete Profile"
        expect(page.status_code).to eq 200
        expect(current_path).to eq root_path
      end
    end
  end
end


describe UsersController, :type => :feature do 
  describe "the user account access flow" do

    before :each do
      @user = User.create(id: 1, username: "capybara", email: "capybara@email.com", password: "password")
    end

    def login_user 
      visit new_user_session_path
      fill_in "Email", :with => "capybara@email.com"
      fill_in "Password", :with => "password"
      click_button "Log in"
    end

    scenario "signs me in" do 
      login_user 
      expect(page).to have_content @user.username
      expect(page).to have_content "Logout"
      expect(page).to have_no_content "Login"
    end
    
    scenario "signs me up" do
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

    scenario "signs me out" do
      login_user
      click_link "Logout"
      expect(current_path).to eq root_path
      expect(page).to have_content "Login"
      expect(page).to have_content "Register"
      expect(page).to have_no_content "Logout"
    end

    scenario "recovers my password" do
      visit new_user_password_path
      fill_in "Email", :with => "capybara@email.com"
      click_button "Send me reset password instructions"
    end

    scenario "shows my profile" do
      login_user
      expect(page).to have_content "Hello capybara"
      expect(page).to have_content "Delete Profile"
      expect(page).to have_content "Edit Profile"
    end

    scenario "edits my profile" do
      login_user
      click_link "Edit Profile"
      fill_in "username", :with => "username2"
      fill_in "first_name", :with => "Alvaro"
      fill_in "last_name", :with => "Delgado"
      fill_in "age", :with => 28
      fill_in "street", :with => "First Ave. No. 1200"
      fill_in "city", :with => "Morelia"
      fill_in "state", :with => "Texas"
      fill_in "zip_code", :with => "100000"
      fill_in "email", :with => "aalvaaro@email.com"
      click_button "Save Changes"
      expect(page.status_code).to eq 200
      expect(current_path).to eq edit_user_path(@user)
    end

    scenario "deletes my profile" do 
      visit user_path(@user)
      click_link "Delete Profile"
      expect(page.status_code).to eq 200
      expect(current_path).to eq root_path
    end

  end
end


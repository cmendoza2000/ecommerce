describe "the user account flow", :type => :feature do 
  before :each do
    @user = User.create(id: 1, username: "capybara", email: "capybara@email.com", password: "password")
  end

  it "signs me in" do
    visit new_user_session_path
    fill_in "Email", :with => "capybara@email.com"
    fill_in "Password", :with => "password"
    click_button "Log in"
    expect(page).to have_content "User Profile"
  end

  it "signs me up" do
    visit new_user_registration_path
    fill_in "Username", :with => "rspec"
    fill_in "Email", :with => "registration@email.com"
    fill_in "Password", :with => "password"
    fill_in "Password confirmation", :with => "password"
    click_button "Sign up"
    expect(page).to have_content "User Profile"
  end

  it "recovers my password" do
    visit new_user_password_path
    fill_in "Email", :with => "capybara@email.com"
    click_button "Send me reset password instructions"
    expect(page).to have_content "An email has been sent to your account"
  end

  it "shows my profile" do
    visit user_path(@user)
    expect(page).to have_content "User Profile"
    expect(page).to have_content "Hello username!"
    
  end

  it "edits my profile" do
    visit edit_user_path(@user)
    fill_in "Username", :with => "aalvaaro"
    fill_in "Email", :with => "aalvaaro@email.com"
    fill_in "City", :with => "Morelia"
    fill_in "State", :with => "Texas"
    fill_in "Zip Code", :with => "100000"
    click_link "Save changes"
    expect(page).to have_content "Your profile has been successfully updated"
  end
end

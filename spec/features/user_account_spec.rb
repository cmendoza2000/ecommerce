describe "the user account flow", :type => :feature do 
  before :each do
    @user = User.create(id: 1, username: "capybara", email: "capybara@email.com", password: "password")
  end

  def login_user 
    visit new_user_session_path
    fill_in "Email", :with => "capybara@email.com"
    fill_in "Password", :with => "password"
    click_button "Log in"
  end

  it "signs me in" do
    login_user
    expect(page).to have_content "You have logged in successfuly"
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
    expect(current_path).to start_with "/users/"
    expect(page).to have_content "Hello rspec"
    expect(page).to have_content "Logout"
    expect(page).to have_no_content "Register"
  end

  it "signs me out" do
    login_user
    click_link "Logout"
    expect(current_path).to eq root_path
    expect(page).to have_content "You have logged out successfuly"
    expect(page).to have_content "Login"
    expect(page).to have_content "Register"
    expect(page).to have_no_content "Logout"
  end

  it "recovers my password" do
    visit new_user_password_path
    fill_in "Email", :with => "capybara@email.com"
    click_button "Send me reset password instructions"
    expect(page).to have_content "You will receive an email with instructions on how to reset your password in a few minutes"
  end

  it "shows my profile" do
    login_user
    expect(page).to have_content "Hello capybara"
    expect(page).to have_content "Delete Profile"
    expect(page).to have_content "Edit Profile"
  end

=begin
  it "edits my profile" do
    login_user
    click_link "Edit Profile"
    expect(current_path).to eq edit_user_path(@user)
    fill_in "Username", :with => "aalvaaro"
    fill_in "Email", :with => "aalvaaro@email.com"
    fill_in "City", :with => "Morelia"
    fill_in "State", :with => "Texas"
    fill_in "Zip Code", :with => "100000"
    click_link "Save changes"
    expect(page).to have_content "Your profile has been successfully updated"
  end

it "deletes my profile" do 
    visit user_path(@user)
    expect(page).to have_selector ".btn.btn-warning.btn-small"
    click_link "Delete Account"
    expect(page).to have_content "Are your sure?"
    click_button "Confirm"
    expect(page).to have_content "Your account has been successfully deleted"
    expect(page).to have_content "RoR e-commerce app"
  end
=end
end

class UserResitrationTest < ActionDispatch::IntegrationTest
  setup do
    Capybara.current_driver = Capybara.javascript_driver
    
    @user = User.create(username: "Antonio", email: "aadelgado@fevaq.net", password: "123456")
  end
  
  test "sign in successfully" do
    visit root_path
    click_link "Login"
    fill_in "Email", :with => "email@email.com"
    fill_in "Password", :with => "password"
    click_link "Login"
    assert page.has_content?("User Profile")
    assert page.has_content?(@user.username)
    assert page.has_content?(@user.email)
  end

  test "sign up" do
    visit root_path
    click_link "Register"
    fill_in "Username", :with => "username2"
    fill_in "Email", :with => "email2@email.com"
    fill_in "Password", :with => "password"
    fill_in "Password confirmation", :with => "password"
    click_button "Sign up"
    assert page.has_content?("User Profile")
    assert page.has_content?(@user.username)
    assert page.has_content?(@user.email)
  end

  test "reset password" do
    visit new_user_session_path
    click_link "Forgot your password?"
    fill_in "Email", :with => "email@email.com"
    find("#reset-password").click()
    assert page.has_content?("An email has been sent to your email address")
  end
  
  test "edit profile" do
    visit user_profile_path(@user)
    click_link "Edit Profile"
    fill_in "Username", :with => "username3"
    fill_in "Email", :with => "email@email.com"
    fill_in "Password", :with => "password2"
    fill_in "Password confirmation", :with => "password2"
    fill_in "Name", :with => "Alvaro"
    fill_in "City", :with => "Morelia"
    fill_in "State", :with => "Michoacan"
    fill_in "Zip Code", :with => "58003"
    click_button "Save Changes"
    assert page.has_content?("User Profile")
    assert page.has_content?("username3")
    assert page.has_content?("email@email.com")
    assert page.has_content?("Alvaro")
    assert page.has_content?("Morelia")
    assert page.has_content?("Michoacan")
    assert page.has_content?("58003")
  end
  
  test "add picture" do
  end
end



class UserRegitrationTest < ActionDispatch::IntegrationTest
  FactoryGirl.define do
    factory :user do
      id "1"
      username "factorygirl"
      email "factorygirl@email.com"
      password "password"
      password_confirmation "password"
    end
  end

  setup do
    Capybara.current_driver = Capybara.javascript_driver
  end

  test "sign up" do
    visit root_path
    click_link "Register"
    fill_in "Username", :with => "aalvaaro"
    fill_in "Email", :with => "integration@email.com"
    fill_in "Password", :with => "12345678"
    fill_in "Password confirmation", :with => "12345678"
    click_button "Sign up"
    assert page.has_content?("User Profile")
    assert page.has_content?(@user.username)
    assert page.has_content?(@user.email)
  end

  test "sign in" do
    user = FactoryGirl.build(:user)

    visit root_path
    click_link "Login"
    fill_in "Email", :with => "factorygirl@email.com"
    fill_in "Password", :with => "12345678"
    click_link "Login"
    assert page.has_content?("User Profile")
    assert page.has_content?(user.username)
    assert page.has_content?(user.email)
  end


  test "reset password" do
    user = FactoryGirl.build(:user)

    visit root_path
    click_link "Login"
    click_link "Forgot your password?"
    fill_in "Email", :with => "factorygirl@email.com"
    find("#reset-password").click()
    assert page.has_content?("An email has been sent to your email address")
  end
  
  test "edit profile" do
    user = FactoryGirl.build(:user)

    visit user_path(user)
    click_link "Edit Profile"
    fill_in "Username", :with => "aalvaaro2"
    fill_in "Email", :with => "integration2@email.com"
    fill_in "Password", :with => "87654321"
    fill_in "Password confirmation", :with => "87654321"
    fill_in "Name", :with => "Alvaro"
    fill_in "City", :with => "Zamora"
    fill_in "State", :with => "Texas"
    fill_in "Zip Code", :with => "18000"
    click_button "Save Changes"
    assert page.has_content?("User Profile")
    assert page.has_content?("username3")
    assert page.has_content?("email@email.com")
    assert page.has_content?("Alvaro")
    assert page.has_content?("Morelia")
    assert page.has_content?("Michoacan")
    assert page.has_content?("58003")
  end
  
end



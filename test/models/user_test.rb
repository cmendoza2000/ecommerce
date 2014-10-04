require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Username's validations
  test "should not save user without username" do
    user = users(:user_without_username)
    assert_not user.save
  end
  
  test "should not save a repeated username" do
    user = users(:user)
    user_2 = users(:user_2)
    user_2.username = "username"
    assert_not user_2.save
  end
  
  test "should not save username with less than 2 characters" do
    user = users(:user)
    user.username = "a"
    assert_not user.save
  end
  
  test "should not save username with more than 15 characters" do
    user = users(:user)
    user.username = "username12345678"
    assert_not user.save
  end
  
  # Email validations 
  test "should not save user without email" do
    user = users(:user_without_email)
    assert_not user.save
  end

  test "should not save a repeated email" do
    user = users(:user)
    user_2 = users(:user_2)
    user_2.email = "email@email.com"
    assert_not user_2.save
  end

  test "should not save an email without a valid format" do 
    user = users(:user_with_invalid_email)
    assert_not user.save
  end

  # Zip code validations
  test "should not save a zip code with less than 5 characters" do
    user = users(:user)
    user.zip_code = 1234
    assert_not user.save
  end
  
  test "should not save a zip code with more than 6 characters" do
    user = users(:user)
    user.zip_code = 1234567
    assert_not user.save
  end
end

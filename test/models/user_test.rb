require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Username's validations
  test "should not save user without username" do
    user = users(:one)
    user.username = nil
    assert_not user.save
  end
  
  test "should not save a repeated username" do
    user = users(:one)
    copy = User.new(username: "AAlvAAro")
    assert_not copy.save
  end
  
  test "should not save username with less than 2 characters" do
    user = users(:one)
    user.username = "a"
    assert_not user.save
  end
  
  # Email validations 
  test "should not save user without email" do
    user = users(:one)
    user.email = nil
    assert_not user.save
  end

  test "should not save a repeated email" do
    user = users(:one)
    copy = User.new(email: "email@gmail.com")
    assert_not copy.save
  end

  test "should not save an email without a valid format" do 
    user = users(:one)
    user.email = "email.com"
    assert_not user.save
  end

end

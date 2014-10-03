require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save user without username" do
    user = user(:one)
    user.first_name = nil
    assert_not user.save, "Saved user without username"
  end
  
  test "should not save user without email" do
    user = user(:one)
    user.email= nil
    assert_not user.save, "Saved user without email"
  end

  test "should not save a repeated username" do
    user = user(:one)
    copy = User.new(username: "AAlvAAro")
    assert_not copy.save, "Saved username that already exists"
  end

  test "should not save a repeated email" do
    user = user(:one)
    copy = User.new(email: "email@gmail.com")
    assert_not copy.save
  end

  test "should delete a user" do
    user = user(:one)
    user.destroy
    assert User.count == 0
  end

end

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save user without name" do
    user = User.new
    assert_not user.save
  end

  test "should not save a repeated name" do
    user = User.new(first_name: "Alvaro").save
    copy = User.new(first_name: "Alvaro")
    assert_not copy.save
  end

  test "should not save user without email" do
    user = User.new
    assert_not user.save
  end

  test "should not save user without username" do
    user = User.new
    assert_not user.save
  end
end

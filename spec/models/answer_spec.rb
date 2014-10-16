require 'rails_helper'

describe Answer, :type => :model do
  it "should not be empty"
  it "should not have less than 10 characters"
  it "should not have more than 50 characters"
  it "should belong to a user"
  it "should belong to a question"
end

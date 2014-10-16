require 'rails_helper'

describe Question, :type => :model do
  it "should not be empty"
  it "should have more than 10 characters"
  it "should not have more than 50 characters"
  it "should belong to a user"
  it "should belong to an article"
end

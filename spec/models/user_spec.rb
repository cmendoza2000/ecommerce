describe User, :type => :model do
  before :each do
    @base_user = FactoryGirl.create(:user)
  end

  def object_validations
    expect(@user).not_to be_valid
    expect(@user.errors).not_to be_empty
  end

  # Username's validations 
  it "should not save users without username" do
    @user = FactoryGirl.build(:user_without_username)
    object_validations
  end

  it "should not save users with a repeated username" do
    @user = FactoryGirl.build(:user2)
    @user.username = @base_user.username
    object_validations
  end
  
  it "should not save a username with more than 15 characters" do
    @user = FactoryGirl.build(:user_with_big_username)
    object_validations
  end
  
  it "should not save a username with less than 2 characters" do
    @user = FactoryGirl.build(:user_with_small_username)
    object_validations
  end

  # Email validations
  it "should not save users without email" do
    @user = FactoryGirl.build(:user_without_email)
    object_validations
  end

  it "should not save a repeated email" do
    @user = FactoryGirl.build(:user2)
    @user.email = @base_user.email
    object_validations
  end

  # Zip code validations
  it "should not save a zip code with less than 5 characters" do
    @user = FactoryGirl.build(:small_zip_code)
    object_validations
  end

  it "should not save a zip code with more than 6 characters" do
    @user = FactoryGirl.build(:big_zip_code)
    object_validations
  end
end

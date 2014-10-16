describe Article, :type => :model do
  before :each do
    @base_article = FactoryGirl.create(:article)
  end

  def object_validations
    expect(@article).not_to be_valid
    expect(@article.errors).not_to be_empty
  end

  # Article's name tests
  it "should not save an article without a name" do
    @article = FactoryGirl.build(:article_without_name)
    object_validations
  end

  it "should not save a repeated name" do
    @article = FactoryGirl.build(:article2)
    @article.name = @base_article.name
    object_validations
  end

  it "should not save an article with a name with less than 4 characters" do
    @article = FactoryGirl.build(:small_article_name)
    object_validations
  end

  it "should not save an article with a name with more than 15 characters" do
    @article = FactoryGirl.build(:big_article_name)
    object_validations
  end

  # Article's category tests
  it "should not save an article without a category" do
    @article = FactoryGirl.build(:article_without_category)
  end

  # Article's price
  it "should not save an article without a price" do
    @article = FactoryGirl.build(:article_without_price)
    object_validations
  end

  # Article's slug
  it "should create a slug with the name of the article" do
    expect(@base_article.slug).to eq @base_article.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  it "should belong to a user"
end

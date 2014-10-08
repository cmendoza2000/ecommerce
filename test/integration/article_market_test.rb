class ArticleMarketTest < ActionDispatch::IntegrationTest
  FactoryGirl.define do
    factory :article do
      id "1"
      name "Awesome Article"
      category "Home"
      price "99.90"
      description "This is an awesome article and its really cheap"
    end
  end

  setup do
    Capybara.current_driver = Capybara.javascript_driver
  end

  test "show article" do
    article = FactoryGirl.build(:article)

    visit article_path(article)
    assert page.has_content?(article.name)
    assert page.has_content?(article.category)
    assert page.has_content?(article.description)
    assert page.has_content?(article.price)
  end
end

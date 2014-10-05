require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

  # Article's name tests
  test "should not save an article without a name" do
    article = articles(:article_without_name)
    assert_not article.save
  end

  test "should not save a repeated name" do
    article = articles(:article)
    copy = articles(:article_2)
    copy.name = "article"
    assert_not copy.save
  end

  test "should not save an article with a name smaller than 4 characters" do
    article = articles(:article)
    article.name = "123"
    assert_not article.save
  end

  test "should not save an article with a name bigger than 15 characters" do
    article = articles(:article)
    article.name = "this is a string greater than 15 characters"
    assert_not article.save
  end

  # Article's category tests
  test "should not save an article without a category" do
    article = articles(:article_without_category)
    assert_not article.save
  end

  # Article's price tests
  test "should not save an article without price" do
    article = articles(:article_without_price)
    assert_not article.save
  end

  test "should not save an article with an invalid price format" do
  end

end

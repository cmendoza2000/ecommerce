FactoryGirl.define do
  factory :article do
    id 1
    user_id 1
    name "Coca Cola"
    category "food"
    price 99.90
    description "This is a brand new fresh Coca-Cola beverage"

    factory :article2, class: Article do
      id 2
      name "Pepsi"
      category "food"
      price 100.50
      description "This soda is not that sweet"
      
      factory :article_without_name do 
        name nil
      end

      factory :article_without_price do
        price nil
      end
      
      factory :article_without_category do
        category nil
      end

      factory :small_article_name do
        name "123"
      end

      factory :big_article_name do
        name "big article name"
      end
    end
  end

  factory :user do
    id 1
    username "capybara"
    email "capybara@email.com"
    password "password"
  end
    
  factory :user2, class: User do
    id 2
    username "rspec"
    email "rspec@email.com"
    password "password"

    factory :user_without_username do
      username nil
    end
    
    factory :user_with_big_username do
      username "12345678username"
    end

    factory :user_with_small_username do
      username "a"
    end

    factory :user_without_email do
      email  nil
    end

    factory :small_zip_code do
      zip_code 1234
    end

    factory :big_zip_code do
      zip_code 1234567
    end
  end
end



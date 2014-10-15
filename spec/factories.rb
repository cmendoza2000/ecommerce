FactoryGirl.define do
  factory :article do
    id 1
    user_id 1
    name "Coca Cola"
    category "food"
    price 99.90
    description "This is a brand new fresh Coca-Cola beverage"
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



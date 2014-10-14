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
end



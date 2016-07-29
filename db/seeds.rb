p 'seeding'

p 'seeding users...'
30.times do |i|
  User.create!(
    email: "user_#{i}@mail.com",
    password: 'qwertyuiop',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: "user_##{i}",
    gender: ["Male", "Female"].sample,
    age: rand(12..99),
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip_code: Faker::Number.number(5),
    street: Faker::Address.street_address
  )
  p "user ##{i} created"
end
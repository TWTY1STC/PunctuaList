require 'faker'

#Create users
10.times do
  User.create!(
    username: Faker::Internet.user_name,
    email:  Faker::Internet.email,
    password: "password"
)
end
users = User.all

#Create items
100.times do
  item = Item.create!(
    user: users.sample,
    name: Faker::Lorem.sentence
  )
  item.update_attribute(:created_at, rand(10.minutes .. 10.days).ago)
end
items = Item.all

puts "Seed finished"
puts "#{User.count} users created."
puts "#{Item.count} items created."
  

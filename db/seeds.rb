require 'faker'

20.times do
  User.create(username: Faker::Internet.username(5..8), password: Faker::Internet.password(5, 10), email: Faker::Internet.email, date_of_birth: Faker::Date.birthday(18, 65))
end

50.times do
  Shout.create(text: Faker::Quote.famous_last_words, user_id: rand(1..20))
end

80.times do
  Comment.create(text: Faker::Quote.famous_last_words, shout_id: rand(1..50), user_id: rand(1..20))
  Like.create(shout_id: rand(1..50), user_id: rand(1..20))
end

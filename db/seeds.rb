require 'faker'

10.times do
  User.create(username: Faker::Internet.unique.username(5..8), password_digest: Faker::Internet.password(5, 10), email: Faker::Internet.email, date_of_birth: Faker::Date.birthday(18, 65))
end

25.times do
  Shout.create(text: Faker::Quote.famous_last_words, user_id: rand(1..10))
end

50.times do
  Comment.create(text: Faker::Quote.famous_last_words, shout_id: rand(1..25), user_id: rand(1..10))
end

100.times do
  Like.create(likeable: Shout.all[rand(0..49)], user_id: rand(1..10))
  Like.create(likeable: Comment.all[rand(0..79)], user_id: rand(1..10))
end

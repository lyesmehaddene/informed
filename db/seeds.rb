require "faker"

puts 'Destroying all...'
User.destroy_all
Post.destroy_all
Comment.destroy_all

10.times do
  User.create(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: "password"
  )
end

25.times do
  Post.create(
    title: Faker::Company.bs,
    content: Faker::Lorem.paragraph(sentence_count: 30),
    user_id: rand(1..10),
    url: Faker::Internet.url
  )
end

50.times do
  Comment.create(
    content: Faker::Lorem.paragraph(sentence_count: 10),
    user_id: rand(1..10),
    post_id: rand(1..25)
  )
end

puts "Data Seeded"

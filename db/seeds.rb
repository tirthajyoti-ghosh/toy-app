# Create a sample user
User.create!(name: "Example User",
             email: "example@example.com",
             password: "foobar",
             password_confirmation: "foobar",
             admin: true)

# Generate other users
99.times do |n|
  User.create!(name: Faker::Name.name,
               email: "example-#{n+1}@example.com",
               password: "password",
               password_confirmation: "password")
end

# Generate microposts for a subset of users.
users = User.order(:created_at).take(6)

50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.microposts.create!(content: content) }
end

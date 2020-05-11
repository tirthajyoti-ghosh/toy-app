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

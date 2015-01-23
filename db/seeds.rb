User.create!( name:  "Example User",
              email: "example@realscout.com",
              password:              "foobar",
              password_confirmation: "foobar",
              admin: true)

20.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@realscout.com"
  password = "password"
  User.create!( name:  name,
                email: email,
                password:              password,
                password_confirmation: password)
end

users = User.order(:created_at).take(4)
20.times do
  content = Faker::Hacker.say_something_smart
  users.each { |user| user.tasks.create!(content: content) }
end

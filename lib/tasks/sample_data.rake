namespace :db do 
  desc "Fill database with sample data"
  task populate: :environment do 
  User.create!(name: "Deep",
                   email: "deep@deep.com",
                   password: "password",
                   password_confirmation: "password")
  50.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@example.org"
    password  = "password"
    User.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password)
  end

    users = User.all
    50.times do
      title = "title"
      content = "blah blah blah"
      users.each { |user| user.blogs.create!(title: title, content: content)}
    end
  end
end
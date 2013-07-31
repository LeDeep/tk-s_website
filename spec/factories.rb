FactoryGirl.define do 
  factory :user do 
    name  "John"
    email "John@example.com"
    password  "password"
    password_confirmation "password"
  end

  factory :profile do 
    bio "This is my bio"
    favorite_family_memory "That one time"
    location "San Francisco, CA"
    birthday "2013-1-1"
    user_id 1
  end
end
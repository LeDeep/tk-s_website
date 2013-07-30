FactoryGirl.define do 
  factory :user do 
    name  "Deep"
    email "deep@deep.com"
    password  "password"
    password_confirmation "password"
  end

  factory :profile do 
    bio "This is my bio"
    favorite_family_memory "That one time"
    location "San Francisco, CA"
    birthday "2013-01-01"
    user_id 1
  end
end
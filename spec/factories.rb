FactoryGirl.define do 


  factory :user do 
    sequence(:name)  {|n| "User #{n}"}
    sequence(:email) {|n| "user#{n}@sample.com"}
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

  factory :blog do 
    title "Today's Blog"
    content "yada yada yada"
    user
  end
end
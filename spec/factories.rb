FactoryGirl.define do 
  factory :user do 
    name  "Deep"
    email "deep@example.com"
    password  "password"
    password_confirmation "password"
  end
end
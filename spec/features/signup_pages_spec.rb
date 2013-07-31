require 'spec_helper'

feature 'invalid sign up' do 
  let(:user) {FactoryGirl.build(:user)}
  scenario "won't sign up a user with out the email address" do
    visit signup_path
    fill_in "Name", :with => user.name
    fill_in "Email", :with => ""
    fill_in "Password", :with => user.password
    fill_in "Password Confirmation", :with => user.password_confirmation
    click_button "Create User"
    page.should have_content "Email can't be blank"
  end

  scenario "won't sign up a user with invalid email address" do
    visit signup_path
    fill_in "Name", :with => user.name
    fill_in "Email", :with => 'email@email'
    fill_in "Password", :with => user.password
    fill_in "Password Confirmation", :with => user.password_confirmation
    click_button "Create User"
    page.should have_content "Email is invalid"
  end

  scenario "won't sign up user if password is shorter than 8 characters" do
    visit signup_path
    fill_in "Name", :with => user.name
    fill_in "Email", :with => user.email
    fill_in "Password", :with => 'wrong'
    fill_in "Password Confirmation", :with => 'wrong'
    click_button "Create User"
    page.should have_content "Password is too short"
  end


  scenario "won't sign up user if password confirmation doesn't match" do
    visit signup_path
    fill_in "Name", :with => user.name
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    fill_in "Password Confirmation", :with => 'wrong'
    click_button "Create User"
    page.should have_content "Password doesn't match confirmation"
  end
end

# feature 'valid sign up' do 
#   let(:user) {FactoryGirl.build(:user)}
#   scenario "creates a new user and logs them in" do
#     visit signup_path
#     fill_in "Name", :with => user.name
#     fill_in "Email", :with => user.email
#     fill_in "Password", :with => user.password
#     fill_in "Password Confirmation", :with => user.password_confirmation
#     click_button "Create User"
#     page.should have_content "Welcome #{user.name.capitalize}! Please complete your profile."
#   end
# end

feature 'sign out' do 
  let(:user) {FactoryGirl.create :user}
  scenario "Signs out a user" do 
    visit signin_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button "Sign in"
    click_on "#{user.name}"
    click_link "Sign out"
    page.should have_content "You have successfully signed out."
  end
end


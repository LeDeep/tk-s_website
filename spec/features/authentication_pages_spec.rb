require 'spec_helper'


feature 'invalid sign in' do 
  let(:user) {FactoryGirl.create(:user)}
  scenario "won't sign in a user without a valid username" do
    visit signin_path
    fill_in "Email", :with => "incorrect"
    fill_in "Password", :with => user.password
    click_button "Sign in"
    page.should have_content 'Invalid email or password. Please try again.'
  end
end

feature 'Sign in' do
  let(:user) {FactoryGirl.create(:user)}
  scenario "Signs in a user" do
    visit signin_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button "Sign in"
    page.should have_content "Welcome #{user.name}"
  end
end


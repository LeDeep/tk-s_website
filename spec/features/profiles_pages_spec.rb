require 'spec_helper'



feature 'Edit Profile' do 

  let(:user) {FactoryGirl.create :user}
  let(:profile) {FactoryGirl.create :profile}


  # scenario 'use can view profile through navbar link' do 
  #   visit signin_path
  #   fill_in "Email", :with => user.email
  #   fill_in "Password", :with => user.password
  #   click_button "Sign in"
  #   click_on "#{user.name}"
  #   click_on "View Profile"
  #   page.should have_content "Edit Profile"
  # end


  scenario 'a logged in user edits a profile through navbar link' do 
    visit signin_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button "Sign in"
    within(".dropdown-menu") do 
      click_on "View Profile"
    end
    click_on "Edit Profile"
    fill_in "Birthday", :with => profile.birthday
    fill_in "Location", :with => profile.location
    fill_in "Bio", :with => profile.bio
    fill_in "Favorite Family Memory", :with => profile.favorite_family_memory
    click_button "Update Profile"
    page.should have_content "You have successfully updated your profile!"
  end
end

feature 'Edit Settings' do 
  let(:user) {FactoryGirl.create :user}

  scenario 'logged in user can edit their password' do 
    visit signin_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button "Sign in"
    first(:link, "#{user.name}").click
    click_on "Settings"
    fill_in "Name", :with => user.name
    fill_in "Email", :with => user.email
    fill_in "Password", :with => 'newpassword'
    fill_in "Password Confirmation", :with => 'newpassword'
    click_button "Update User"
    page.should have_content "You have successfully updated your information!"
  end
end



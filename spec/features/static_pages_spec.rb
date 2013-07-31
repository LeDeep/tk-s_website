require 'spec_helper'

feature 'static pages' do 
  scenario 'the header should have all the right links' do 
    visit root_path
    click_link "Home"
    page.should have_selector 'h1', text: "Welcome Family"
    click_link "About"
    page.should have_selector 'h1', text: "Kodsantoa/Srichiphan Family Webpage"
    click_link "Contact"
    page.should have_selector 'h3', text: "Contact Information"
    click_link "Family"
    page.should have_selector 'h1', text: "Family Members Who Are On Our Website"
    click_link "Sign in"
    page.should have_selector 'h1', text: "Sign in"
    click_link "Sign up"
    page.should have_selector 'h1', text: "Sign up"
  end
end

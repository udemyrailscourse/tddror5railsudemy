require 'rails_helper'

RSpec.describe "User signup" do
  
  # where user signs up successfully
  scenario "with valid credentials" do
    visit "/"
    
    click_link "Sign up now!"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    
    expect(page).to have_content("You have signed up successfully.")
    
  end
  
  # user cannot signup due to invalid credentials
  scenario "with invalid credentials" do
    visit "/"
    
    click_link "Sign up now!"
    fill_in "Email", with: ""
    fill_in "Password", with: ""
    fill_in "Password confirmation", with: ""
    click_button "Sign up"
    
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
    
  end
  
end
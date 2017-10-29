require 'rails_helper'

RSpec.feature "Landing page" do
  before do
    @john = User.create!(email: "john@example.com", password: "password")
  end
  
  scenario "has 'New Hand' button" do
    visit "/"
    
    click_link "Sign in"
    fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password
    click_button "Log in"
    
    within("h1.page-header") {
      expect(page).to have_content("Welcome to the Casino!")
    }
    
    within("h3.game-prompt") {
      expect(page).to have_content("Want to play a new hand?")
    }
    expect(page).to have_link("New Hand")
    
  end
  
end
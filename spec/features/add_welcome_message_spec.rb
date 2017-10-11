require 'rails_helper'

RSpec.describe "Add welcome message", type: :feature do
  scenario "shows welcome message" do
    visit "/"
    
    within("h1") {
      expect(page).to have_content("Do you want to play blackjack?")
    }
  end
end
require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { Category.new }
  
  it "requires a category name" do
    expect(category).not_to be_valid
    expect(category.errors[:name].any?).to be_truthy
    
    category.name = "Player"
    expect(category).to be_valid
    expect(category.errors[:name].any?).to be_falsey
  end
  
  it "ensures 'Player' and 'Dealer' exist" do
    load "#{Rails.root}/db/seeds.rb"
    names = Category.all.collect { |category| category.name }
    
    expect(Category.count).to eq 2
    expect(names.include?('Player')).to eq(true)
    expect(names.include?('Dealer')).to eq(true)
    
  end
  
end
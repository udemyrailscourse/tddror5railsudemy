require 'rails_helper'

RSpec.describe User, :type => :model do
  # create a user in before do
  before do
    @john = User.new(email: 'john@example.com', password: 'password')
  end
  # sign up with valid email and password
  it "signs up a user with valid email address and password" do
    expect(@john).to be_valid
    expect(@john.errors[:email].any?).to be_falsey
  end
  # require an email address
  it "requires an email address" do
    # set email to nil
    @john.email = nil
    
    expect(@john).not_to be_valid
    expect(@john.errors[:email].any?).to be_truthy
    
  end
  # require a password
  it "requires a password" do
    @john.password = nil
    
    expect(@john).not_to be_valid
    expect(@john.errors[:password].any?).to be_truthy
  end
  
end
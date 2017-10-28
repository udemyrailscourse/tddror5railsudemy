require 'rails_helper'

RSpec.describe "Dashboard", type: :request do
  describe 'Get /' do
    it 'displays the home page' do
      get "/"
      
      expect(response.status).to eq 200
    end
    
    it "redirects to /home if signed in" do
      john = User.create(email: "john@example.com", password: "password")
      login_as(john)
      
      get "/"
      expect(response.status).to eq 302
      expect(response).to redirect_to(home_path)
      
    end
  end
  
  describe 'Get /home' do
    let(:john) { User.create(email: "john@example.com", password: "password")}
    
    context 'with unauthenticated user' do
      before do
        get "/home"
      end
      
      it "redirects to the sign up path" do
        expect(response.status).to eq 302
        expect(response).to redirect_to(user_session_path)
      end
    end
    
    context 'with authenticated user' do
      before do
        login_as(john)
        get "/home"
      end
      
      it "successfully accesses the home page" do
        expect(response.status).to eq 200
      end
    end
    
  end
  
  describe 'POST /users/sign_in' do
    before do
      @john = User.create(email: "john@example.com", password: "password")
      
      post "/users/sign_in",
        params: { user: {email: @john.email, password: "password"} }
    end
    
    it "successfully signs in and redirects to home path" do
      expect(response.status).to eq 302
      expect(response).to redirect_to(home_path)
    end
    
  end
end
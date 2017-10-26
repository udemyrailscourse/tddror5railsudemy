class DashboardController < ApplicationController
  before_action :authenticate_user!, except: [:front]
  
  def front
    redirect_to home_path if current_user
  end
  
  def home
    
  end

end
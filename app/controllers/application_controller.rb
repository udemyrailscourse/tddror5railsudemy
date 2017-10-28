class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  Dir["./lib/**/*.rb"].each do |path|
    require_dependency path
  end
  
  def after_sign_in_path_for(resource)
    home_path  
  end
  
end

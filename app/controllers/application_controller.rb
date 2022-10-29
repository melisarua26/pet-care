class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller

 # before_action :configure_permitted_parameters, if: :devise_controller

 def devise_controller
 end

end

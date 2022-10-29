class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home index show]
  def home
  end

  def profile
  end

  def vet_profile
  end

  def devise_controller
  end
end

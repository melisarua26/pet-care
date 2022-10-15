module ApplicationHelper

  def is_navigational_format?
    Devise.navigational_formats.include?(request_format)
  end

end

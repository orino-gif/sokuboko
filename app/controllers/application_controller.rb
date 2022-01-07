class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :furigana, :sex, :post_number, :address, :telephone_number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :furigana, :sex, :post_number, :address, :telephone_number])
  end
end

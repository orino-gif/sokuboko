class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  before_action :layouts_value
  
  def layouts_value
    @user=current_user
    if user_signed_in?
      @certification = User.find(current_user.id)
    end
  end
  
  #ユーザーログイン後にユーザー情報の画面へ遷移
  def after_sign_in_path_for(resource)
    performer_path(resource)
  end
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :furigana, :sex, :post_number, :address, :telephone_number,:accepted])
    devise_parameter_sanitizer.permit(:account_update, keys: [:post_number, :address, :telephone_number])
  end
end

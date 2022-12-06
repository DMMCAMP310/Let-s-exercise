class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters,if: :devise_controller?
  
  protected
  
  def after_sign_in_path_for(resorce)
    user_path(current_user.id)
  end
  
  def after_sign_out_path_for(resorce)
    root_path
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :introduction, :gender, :age])
  end
end

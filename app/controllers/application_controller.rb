class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about, :sign_up, :log_in]
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_up_path_for(resource)
    user_path(resource)
  end

  protected

  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email])
  end


end

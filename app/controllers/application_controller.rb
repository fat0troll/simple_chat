class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true
  before_action :configure_users_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  protected

  def configure_users_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def set_locale
    preferred_language = request.env['HTTP_ACCEPT_LANGUAGE'].to_s.scan(/^[a-z]{2}/).first
    if preferred_language == "ru" || preferred_language == "end"
      I18n.locale = preferred_language
    else
      # Fallback to en-US
      I18n.locale = "en"
    end
  end
end

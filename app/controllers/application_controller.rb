class ApplicationController < ActionController::Base
  # recordar que de esta carpeta heredan los controllers que vamos generando de forma manuel mediante helpers
  before_action :configure_premited_parameters, if: :devise_controller?

  protected

  def configure_premited_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name shift employee_number admin])
  end
end

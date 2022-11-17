class ApplicationController < ActionController::Base
  # recordar que de esta carpeta heredan los controllers que vamos generando de forma manuel mediante helpers
  before_action :authenticate_user! # esto bloquea todas las rutas, a excepcion que el usuario esté registrado.
  before_action :configure_premited_parameters, if: :devise_controller? # Devise sólo necesita mail y password para funcionar. Con este método permitimos más entradas.

  protected

  def configure_premited_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name shift employee_number admin]) # Aquí determinamos los campos adicionales para el sign up.
  end

  def authenticate_admin!
    authenticate_user!
    redirect_to :root, status: :forbidden unless current_user.admin?
  end
end

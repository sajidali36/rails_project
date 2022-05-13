# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    path = nil
    if resource.manager?
      path = dashboard_managers_path
    elsif resource.developer?
      path = dashboard_developers_path
    elsif resource.qa?
      path = dashboard_qas_path
    end
    path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name user_type])
  end
end

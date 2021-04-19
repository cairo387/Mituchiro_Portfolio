class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    case resource
    when User
      user_user_path(resource)
    when Chiropractor
      chiropractor_chiropractor_path(resource)
    when Admin
      root_path
    end
  end

  def after_sign_up_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    if resource == :user
      root_path
    elsif resource == :admin
      new_admin_session_path
    else
      root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: [
        :nickname,
        :name,
        :postal_code,
        :prefecture_code,
        :address_city,
        :address_street,
        :fare,
        :service_charge,
        :age,
        :sex,
        :nearest_station,
        :treatment_time,
        :phone_number,
        :email
        ]
    )
  end
end

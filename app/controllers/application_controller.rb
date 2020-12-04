# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[nickname profile image])
    end

    def check_guest
      email = resource&.email || params[:user][:email].downcase
      if email == "guest@example.com"
        redirect_to root_path, alert: "ゲストユーザーの変更・削除はできません。"
      end
    end
end

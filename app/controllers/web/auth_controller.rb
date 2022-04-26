# frozen_string_literal: true

module Web
  class AuthController < Web::ApplicationController
    def callback
      user_info = auth[:info]
      user_email = user_info[:email].downcase

      user = User.find_or_initialize_by(email: user_email)
      user.name = user_info[:name]

      if user.save
        sign_in user
        redirect_to root_path, notice: t('auth.success')
      else
        redirect_to root_path, notice: t('auth.fail')
      end
    end

    private

    def auth
      request.env['omniauth.auth']
    end
  end
end

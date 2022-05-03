# frozen_string_literal: true

module Web
  module Admin
    class UsersController < Web::Admin::ApplicationController
      def index
        @users = User.order(created_at: :desc)
      end

      private

      def authorize_user
        authorize %i[admin user]
      end
    end
  end
end

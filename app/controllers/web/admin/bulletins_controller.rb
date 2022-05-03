# frozen_string_literal: true

module Web
  module Admin
    class BulletinsController < Web::Admin::ApplicationController
      def index
        @bulletins = Bulletin.order(created_at: :desc)
      end

      private

      def authorize_user
        authorize %i[admin bulletin]
      end
    end
  end
end

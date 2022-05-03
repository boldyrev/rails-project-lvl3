# frozen_string_literal: true

module Web
  module Admin
    class ApplicationController < Web::ApplicationController
      before_action :authenticate!
      before_action :authorize_user
    end
  end
end

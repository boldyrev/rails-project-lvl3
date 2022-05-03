# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :admin_area?

  private

  def admin_area?
    self.class.module_parent == Web::Admin
  end
end

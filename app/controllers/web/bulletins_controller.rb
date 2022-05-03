# frozen_string_literal: true

module Web
  class BulletinsController < Web::ApplicationController
    def index
      @bulletins = Bulletin.order(created_at: :desc)
    end

    def new
      @bulletin = Bulletin.new
    end

    def create
      @bulletin = current_user.bulletin.build(bulletin_params)

      if @bulletin.save
        redirect_to root_path, notice: t('bulletins.create.success')
      else
        render :new
      end
    end

    def show; end

    private

    def bulletin_params
      params.require(:bulletin).permit(:title, :description, :category_id, :image)
    end
  end
end

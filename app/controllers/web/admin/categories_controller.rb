# frozen_string_literal: true

module Web
  module Admin
    class CategoriesController < Web::Admin::ApplicationController
      def index
        @categories = Category.order(created_at: :desc)
      end

      def new
        @category = Category.new
      end

      def create
        @category = Category.new(category_params)

        if @category.save
          redirect_to admin_categories_path, notice: t('.success')
        else
          render :new, status: :unprocessable_entity
        end
      end

      def edit
        category
      end

      def update
        if category.update(category_params)
          redirect_to admin_categories_path, notice: t('.success')
        else
          render :edit, status: :unprocessable_entity
        end
      end

      def destroy
        if category.destroy
          redirect_to admin_categories_path, notice: t('.success')
        else
          redirect_to admin_categories_path, alert: t('.error')
        end
      end

      private

      def category_params
        params.require(:category).permit(:name)
      end

      def category
        @category ||= Category.find(params[:id])
      end

      def authorize_user
        authorize %i[admin category]
      end
    end
  end
end

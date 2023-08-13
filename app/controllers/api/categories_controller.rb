class Api::CategoriesController < ApplicationController

  def index
    categories = Category.all

    render_success(categories)
  end

  private

  def user_params
    params.permit(:full_name, :role, :user_name, :email, :password, :phone, :document, :description, :business_name, :password_confirmation)
  end

end
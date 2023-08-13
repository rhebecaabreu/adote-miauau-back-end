class Api::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      sign_in user, store: false
      respond_with user, location: '', scope: user.refresh_token
    else
      render_unprocessable_entity_error(user.errors.full_messages)
    end
  end

  private

  def user_params
    params.permit(:full_name, :role, :user_name, :email, :password, :phone, :document, :description, :business_name, :password_confirmation)
  end

end

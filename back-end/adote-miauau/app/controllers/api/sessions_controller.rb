class Api::SessionsController < ApplicationController

  def create
    @user = User.find_for_database_authentication(email: session_params[:email])
    is_valid = @user.valid_password?(session_params[:password]) if @user.present?

    if is_valid
      sign_in @user, store: false
      token = @user.refresh_token
      respond_with @user, location: '', scope: token
    else
      render_unprocessable_entity_error('error')
    end
  end

  private

  def session_params
    params.permit(:email, :password)
  end

end
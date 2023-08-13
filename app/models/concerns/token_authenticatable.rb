require 'bcrypt'

module TokenAuthenticatable
  extend ActiveSupport::Concern

  TOKEN_LENGTH = 32

  def refresh_token
    token           = Devise.friendly_token(TOKEN_LENGTH)
    encrypted_token = BCrypt::Password.create(token)

    update_authentication_token(encrypted_token)

    build_header_auth_response(token)
  end

  def token_match?(token)
    BCrypt::Password.new(authentication_token) === token
  end

  private

  def build_header_auth_response(token)
    {
      token: token,
      email: email
    }
  end

  def update_authentication_token(encrypted_token)
    update(authentication_token: encrypted_token)
  end
end

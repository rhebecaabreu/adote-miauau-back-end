class ApplicationController < ActionController::Base
  include ApiTokenAuthenticatable
  include ApiCommonResponses

  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  respond_to :json

  protected

  def serialize_resource(resource, serializer, scope: nil)
    JSON.parse(serializer.new(resource, scope: scope).to_json)
  end

  def serialize_resource_list(resources, serializer)
    JSON.parse(ActiveModelSerializers::SerializableResource.new(resources, each_serializer: serializer).to_json)
  end

  def serialize_fixed_values(values)
    values
  end
end

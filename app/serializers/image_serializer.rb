class ImageSerializer < ActiveModel::Serializer
  attributes :id, :file_url

  def file_url
    "#{Rails.application.config.action_controller.asset_host}#{object.file&.url}"
  end

end

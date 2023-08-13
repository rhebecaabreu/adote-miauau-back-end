class PetSerializer < ActiveModel::Serializer
  attributes :id, :kind, :age, :vaccinated, :castrated, :vermifugated, :coat_color, :status, :size, :sex, :images

  def images
    ActiveModelSerializers::SerializableResource.new(object.images, each_serializer: ImageSerializer)
  end

end

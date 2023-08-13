class PublicationSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :status, :updated_at

  belongs_to :user

  has_one :address
  has_one :pet, serializer: PetSerializer

end

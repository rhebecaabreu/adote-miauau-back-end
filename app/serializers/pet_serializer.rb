class PetSerializer < ActiveModel::Serializer
  attributes :id, :kind, :age, :vaccinated, :castrated, :vermifugated, :coat_color, :status, :size, :sex, :images

end

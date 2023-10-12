class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  validates :state, :city, :cep, :number, :street, presence: true
end

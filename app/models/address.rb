class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  validates :state, :city, :cep, :number, :street, :complement, presence: true
end

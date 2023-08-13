class Publication < ApplicationRecord
  extend Enumerize

  belongs_to :user
  belongs_to :category

  has_one :pet
  has_one :address, as: :addressable
  has_many :images, through: :pet

  enumerize :status, in: [:waiting_approval, :approved, :denied], default: :waiting_approval

end

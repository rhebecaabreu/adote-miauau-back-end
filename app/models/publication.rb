class Publication < ApplicationRecord
  extend Enumerize

  belongs_to :user
  belongs_to :category

  has_one :pet, dependent: :destroy
  has_one :address, as: :addressable, dependent: :destroy
  has_many :images, through: :pet, dependent: :destroy

  enumerize :status, in: [:waiting_approval, :approved, :denied], default: :waiting_approval

end

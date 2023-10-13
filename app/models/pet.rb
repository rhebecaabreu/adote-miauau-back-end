class Pet < ApplicationRecord
  extend Enumerize

  belongs_to :publication

  has_many :images, as: :imageable

  validates :kind, :age, :coat_color, :status, :size, :sex, presence: true
  # validates :vaccinated, :castrated, :vermifugated, inclusion: [true, false]

  enumerize :status, in: [:looking_home, :found_home], default: :looking_home
  enumerize :kind, in: [:dog, :cat], default: :cat
  enumerize :size, in: [:small, :medium, :big], default: :small
  enumerize :sex, in: [:male, :female, :unknown], default: :female

end

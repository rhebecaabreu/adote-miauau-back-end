class Pet < ApplicationRecord
  extend Enumerize

  belongs_to :publication

  has_many :images, as: :imageable

  enumerize :status, in: [:looking_home, :found_home], default: :looking_home
  enumerize :kind, in: [:dog, :cat], default: :cat
  enumerize :size, in: [:small, :medium, :big], default: :small

end

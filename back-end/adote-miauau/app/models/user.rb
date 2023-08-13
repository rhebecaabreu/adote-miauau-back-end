class User < ApplicationRecord
  include TokenAuthenticatable
  extend Enumerize
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enumerize :role, in: [:protector, :ong], default: :protector
  enumerize :permissions, in: [:common, :admin], default: :common

  has_many :publications
  has_one :address, as: :addressable

end


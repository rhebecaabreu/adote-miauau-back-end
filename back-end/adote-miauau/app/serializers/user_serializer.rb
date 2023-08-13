class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :role, :permissions, :full_name, :user_name, :phone

end

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :phone_number

  has_many :gears
end

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :phone_number

  has_many :gears
  # has_many :images, through: :gears
end

class GearSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :category, :make, :model, :color, :serial_number, :other_info, :missing, :registered

  belongs_to :user
  has_many :images
end

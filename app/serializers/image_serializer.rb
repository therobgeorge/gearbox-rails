class ImageSerializer < ActiveModel::Serializer
  attributes :id, :gear_id, :photo_url

  belongs_to :gear
end

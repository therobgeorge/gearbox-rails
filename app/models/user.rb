class User < ApplicationRecord
  has_many :gears
  has_many :images, through: :gears

  has_secure_password
  validates :email, presence: true, uniqueness: true


end

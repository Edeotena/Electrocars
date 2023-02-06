class Point < ApplicationRecord
  has_many :station, dependent: :destroy

  validates_presence_of :name, :latitude, :longitude
  validates_uniqueness_of :name
end

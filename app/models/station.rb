class Station < ApplicationRecord
  belongs_to :point
  has_many :connectors, dependent: :destroy

  validates :serial_number, presence: true, uniqueness: true
end

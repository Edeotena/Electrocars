class Connector < ApplicationRecord
  belongs_to :station
  has_many :sessions

  valid_types = ['CHAdeMO', 'CCS Combo 2', 'Type 2']

  validates :power, presence: true, numericality: {greater_than: 0}
  validates :connector_type, presence: true, inclusion: { in: valid_types}
end

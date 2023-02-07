class Connector < ApplicationRecord
  belongs_to :station

  valid_types = ['CHAdeMO', 'CCS Combo 2', 'Type 2']

  validates :power, presence: true, numericality: {greater_than: 0}
  validates :type, presence: true, inclusion: { in: valid_types}
end

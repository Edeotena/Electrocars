class Session < ApplicationRecord
  belongs_to :client
  belongs_to :connector

  valid_statuses = %w[active disable]

  validates :status, presence: true,  numericality: { greater_than: 0 }
  validates :energy, presence: true, inclusion: { in: valid_statuses }

end

class Client < ApplicationRecord
  has_many :sessions

  validates_presence_of :full_name, :phone_number
  validates_uniqueness_of :phone_number
end

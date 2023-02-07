class Client < ApplicationRecord
  has_many :sessions

  validates_presence_of :full_name, :phone_number
  validates_uniqueness_of :phone_number

  def get_active
    self.sessions.where(status: 'active')
  end
  def is_free?
    self.get_active.empty?
  end
end

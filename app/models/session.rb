class Session < ApplicationRecord
  belongs_to :client
  belongs_to :connector

  valid_statuses = %w[active disable]

  validates :status, presence: true, inclusion: { in: valid_statuses }
  validates :energy, presence: true, numericality: { greater_than: 0 }
  validate :check_connector, :check_client

  private
  def check_connector
    if status == 'active'
    connector = Connector.find(connector_id)
    unless connector.is_free?
      sessions = connector.get_active
      sessions.each do |session|
        unless session.id == self.id
          errors.add( :connector_id, "must be free")
        end
      end
    end
    end
  end

  def check_client
    if status == 'active'
    client = Client.find(client_id)
    unless client.is_free?
      sessions = client.get_active
      sessions.each do |session|
        unless session.id == self.id
          errors.add( :client_id, "must be free")
        end
      end
    end
    end
  end

end

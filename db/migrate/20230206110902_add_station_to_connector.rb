class AddStationToConnector < ActiveRecord::Migration[7.0]
  def change
    add_reference :connectors, :station, null: false, foreign_key: true
  end
end

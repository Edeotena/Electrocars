class CreateStations < ActiveRecord::Migration[7.0]
  def change
    create_table :stations do |t|
      t.string :serial_number

      t.timestamps
    end
  end
end

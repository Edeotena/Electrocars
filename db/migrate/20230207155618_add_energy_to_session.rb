class AddEnergyToSession < ActiveRecord::Migration[7.0]
  def change
    add_column :sessions, :energy, :decimal
  end
end

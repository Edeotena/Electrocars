class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    change_table :connectors do |t|
      t.rename :type, :connector_type
      end
  end
end

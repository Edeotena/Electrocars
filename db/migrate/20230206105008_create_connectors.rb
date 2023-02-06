class CreateConnectors < ActiveRecord::Migration[7.0]
  def change
    create_table :connectors do |t|
      t.string :type
      t.decimal :power

      t.timestamps
    end
  end
end

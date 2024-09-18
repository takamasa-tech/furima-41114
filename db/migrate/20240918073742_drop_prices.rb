class DropPrices < ActiveRecord::Migration[7.0]
  def up
    drop_table :prices
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end

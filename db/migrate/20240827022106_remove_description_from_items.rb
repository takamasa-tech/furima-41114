class RemoveDescriptionFromItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :description
    remove_column :items, :shipping_fee_id, :integer
  end
end

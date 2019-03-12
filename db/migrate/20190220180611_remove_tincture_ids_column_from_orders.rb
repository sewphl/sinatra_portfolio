class RemoveTinctureIdsColumnFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :tincture_ids
  end
end

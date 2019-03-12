class RemoveTinctureIdColumnFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :tincture_id
  end
end

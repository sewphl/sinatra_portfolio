class AddTinctureIdsColumnToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :tincture_ids, :integer, array: true, default: []
  end
end

class AddCompletedOrderColumnToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :completed_order, :integer
  end
end

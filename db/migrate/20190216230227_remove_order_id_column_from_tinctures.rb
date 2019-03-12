class RemoveOrderIdColumnFromTinctures < ActiveRecord::Migration
  def change
    remove_column :tinctures, :order_id
  end
end

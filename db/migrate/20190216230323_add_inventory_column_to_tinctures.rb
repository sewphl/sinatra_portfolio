class AddInventoryColumnToTinctures < ActiveRecord::Migration
  def change
    add_column :tinctures, :inventory, :integer
  end
end

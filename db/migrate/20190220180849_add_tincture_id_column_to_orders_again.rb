class AddTinctureIdColumnToOrdersAgain < ActiveRecord::Migration
  def change
    add_column :orders, :tincture_id, :integer
  end
end

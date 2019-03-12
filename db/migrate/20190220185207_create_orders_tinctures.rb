class CreateOrdersTincture < ActiveRecord::Migration
  def change
    create_table :orders_tinctures do |t|
      t.integer :order_id
      t.integer :tincture_id
    end
  end
end

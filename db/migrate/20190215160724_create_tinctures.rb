class CreateTinctures < ActiveRecord::Migration
  def change
    create_table :tinctures do |t|
      t.string :name
      t.string :supports
      t.integer :order_id
    end
  end
end

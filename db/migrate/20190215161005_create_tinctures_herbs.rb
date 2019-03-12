class CreateTincturesHerbs < ActiveRecord::Migration
  def change
    create_table :tinctures_herbs do |t|
      t.integer :tincture_id
      t.integer :herb_id
    end
  end
end

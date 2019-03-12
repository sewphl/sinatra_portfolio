class AddHerbIdsColumnToTinctureHerbs < ActiveRecord::Migration
  def change
    add_column :tincture_herbs, :herb_ids, :integer, array: true, default: []
  end
end

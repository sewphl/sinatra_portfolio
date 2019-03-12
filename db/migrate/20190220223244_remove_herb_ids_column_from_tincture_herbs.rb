class RemoveHerbIdsColumnFromTinctureHerbs < ActiveRecord::Migration
  def change
    remove_column :tincture_herbs, :herb_ids
  end
end

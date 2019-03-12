class RemoveHerbIdColumnFromTinctureHerbs < ActiveRecord::Migration
  def change
    remove_column :tincture_herbs, :herb_id
  end
end

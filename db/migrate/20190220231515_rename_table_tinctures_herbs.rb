class RenameTableTincturesHerbs < ActiveRecord::Migration
  def change
    rename_table :tincture_herbs, :tinctures_herbs
  end
end

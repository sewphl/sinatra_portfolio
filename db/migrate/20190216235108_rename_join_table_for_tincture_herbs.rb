class RenameJoinTableForTinctureHerbs < ActiveRecord::Migration
  def change
    rename_table :tinctures_herbs, :tincture_herbs
  end
end

class AddHerbIdColumnToTinctureHerbs < ActiveRecord::Migration
  def change
    add_column :tincture_herbs, :herb_id, :integer
  end
end

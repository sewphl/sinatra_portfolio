class AddLatinNameColumnToHerbs < ActiveRecord::Migration
  def change
    add_column :herbs, :latin_name, :string
  end
end

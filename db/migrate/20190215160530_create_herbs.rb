class CreateHerbs < ActiveRecord::Migration
  def change
    create_table :herbs do |t|
      t.string :name
      t.string :plant_part
    end
  end
end

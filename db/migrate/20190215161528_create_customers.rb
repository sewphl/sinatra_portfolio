class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :email
      t.string :password_digest
    end
  end
end

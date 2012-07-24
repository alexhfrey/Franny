class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :address
      t.integer :delivery_route

      t.timestamps
    end
  end
end

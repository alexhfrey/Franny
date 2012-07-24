class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :monday_orders
      t.integer :tuesday_orders
      t.integer :wednesday_orders
      t.integer :thursday_orders
      t.text :address
      t.string :email
      t.string :phone
      t.string :name
      t.references :customer
      t.references :week

      t.timestamps
    end
    add_index :orders, :customer_id
    add_index :orders, :week_id
  end
end

class CreateExtraOrders < ActiveRecord::Migration
  def change
    create_table :extra_orders do |t|
      t.integer :extra_id
      t.integer :order_id
      t.integer :quantity

      t.timestamps
    end
  end
end

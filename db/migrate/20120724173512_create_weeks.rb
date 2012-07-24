class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.date :start_date
      t.string :monday_item
      t.float :monday_price
      t.string :tuesday_item
      t.float :tuesday_price
      t.string :wednesday_item
      t.float :wednesday_price
      t.string :thursday_item
      t.float :thursday_price
      t.float :delivery_fee
      t.text :comment

      t.timestamps
    end
  end
end

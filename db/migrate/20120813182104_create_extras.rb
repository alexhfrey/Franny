class CreateExtras < ActiveRecord::Migration
  def change
    create_table :extras do |t|
      t.integer :week_id
      t.string :name
      t.decimal :price

      t.timestamps
    end
  end
end

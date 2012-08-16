class AddPaidColumnToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :paid, :decimal
  end
end

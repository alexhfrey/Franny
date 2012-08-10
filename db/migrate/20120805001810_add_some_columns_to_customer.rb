class AddSomeColumnsToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :remember, :boolean
  end
end

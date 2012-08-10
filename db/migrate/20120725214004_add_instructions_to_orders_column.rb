class AddInstructionsToOrdersColumn < ActiveRecord::Migration
  def change
    add_column :orders, :instructions, :text
  end
end

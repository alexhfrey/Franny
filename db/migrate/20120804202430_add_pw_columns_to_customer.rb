class AddPwColumnsToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :password_digest, :string
  end
end

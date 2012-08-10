class AddPwColumnsToIdentity < ActiveRecord::Migration
  def change
    add_column :identities, :phone, :string
    add_column :identities, :address, :text
  end
end

class ChangeAddresseIntoAddress < ActiveRecord::Migration
  def change
    change_column :partners, :address, :string
  end
end

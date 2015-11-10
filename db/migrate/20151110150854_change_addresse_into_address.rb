class ChangeAddresseIntoAddress < ActiveRecord::Migration
  def change
    rename_column :partners, :addresse, :address
  end
end

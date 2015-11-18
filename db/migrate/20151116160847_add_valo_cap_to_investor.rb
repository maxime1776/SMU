class AddValoCapToInvestor < ActiveRecord::Migration
  def change
    add_column :investors, :valo_cap, :text
  end
end

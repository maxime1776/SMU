class AddValoFloorToInvestor < ActiveRecord::Migration
  def change
    add_column :investors, :valo_floor, :text
  end
end

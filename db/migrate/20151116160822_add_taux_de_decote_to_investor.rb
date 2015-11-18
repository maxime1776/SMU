class AddTauxDeDecoteToInvestor < ActiveRecord::Migration
  def change
    add_column :investors, :rate_drop, :text
  end
end

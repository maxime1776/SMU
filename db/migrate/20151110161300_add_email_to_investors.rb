class AddEmailToInvestors < ActiveRecord::Migration
  def change
    add_column :investors, :email, :text
  end
end

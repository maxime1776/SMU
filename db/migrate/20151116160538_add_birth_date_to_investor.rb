class AddBirthDateToInvestor < ActiveRecord::Migration
  def change
    add_column :investors, :birthdate, :text
  end
end

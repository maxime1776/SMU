class AddBirthLocalizationToInvestor < ActiveRecord::Migration
  def change
    add_column :investors, :birthplace, :text
  end
end

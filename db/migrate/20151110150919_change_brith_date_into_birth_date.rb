class ChangeBrithDateIntoBirthDate < ActiveRecord::Migration
  def change
    change_column :partners, :birth_date, :date
  end
end

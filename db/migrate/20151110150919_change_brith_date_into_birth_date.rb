class ChangeBrithDateIntoBirthDate < ActiveRecord::Migration
  def change
    rename_column :partners, :brith_date, :birth_date
  end
end

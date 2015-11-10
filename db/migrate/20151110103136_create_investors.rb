class CreateInvestors < ActiveRecord::Migration
  def change
    create_table :investors do |t|
      t.string :first_name
      t.string :last_name
      t.string :nationality
      t.string :address
      t.integer :amount_raised

      t.timestamps null: false
    end
  end
end

class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :phone
      t.string :addresse
      t.datetime :brith_date
      t.string :birth_location
      t.string :nationality
      t.boolean :admin

      t.timestamps null: false
    end
  end
end

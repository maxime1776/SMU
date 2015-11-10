class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.text :company_status
      t.string :headquarters_address
      t.string :company_name
      t.integer :share_capital
      t.integer :rcs_number
      t.string :rcs_city
      t.text :company_object
      t.date :company_created_on
      t.integer :amount_to_be_raised
      t.integer :founders_receivables
      t.text :specific_engagment
      t.text :investisors_right
      t.text :juridiction_law
      t.date :signed_on
      t.string :signature_localization

      t.timestamps null: false
    end
  end
end

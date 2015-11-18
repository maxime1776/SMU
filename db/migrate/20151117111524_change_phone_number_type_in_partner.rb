class ChangePhoneNumberTypeInPartner < ActiveRecord::Migration
  def change
    change_column :partners, :phone, :string
  end
end

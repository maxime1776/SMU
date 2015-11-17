class AddFoundersReceilvablesToPartners < ActiveRecord::Migration
  def change
    add_column :partners, :founders_receivables, :text
  end
end

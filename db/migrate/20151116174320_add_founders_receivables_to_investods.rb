class AddFoundersReceivablesToInvestods < ActiveRecord::Migration
  def change
    add_column :investors, :founders_receivables, :text
  end
end

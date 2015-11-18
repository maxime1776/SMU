class RemoveFoundersReceivablesFromInvestors < ActiveRecord::Migration
  def change
    remove_column :investors, :founders_receivables, :text
  end
end

class RemoveFoundersReceivablesFromContracts < ActiveRecord::Migration
  def change
    remove_column :contracts, :founders_receivables, :text
  end
end

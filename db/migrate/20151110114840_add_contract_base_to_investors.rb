class AddContractBaseToInvestors < ActiveRecord::Migration
  def change
    add_reference :investors, :contract, index: true, foreign_key: true
  end
end

class AddContractReftoStartupers < ActiveRecord::Migration
  def change
    add_reference :partners, :contract, index: true, foreign_key: true
  end
end

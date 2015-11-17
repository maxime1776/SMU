class AddPriceToContracts < ActiveRecord::Migration
  def change
    add_monetize :contracts, :price, currency: { present: false }, default: 6000
    add_column :contracts, :payment, :json
    add_column :contracts, :state, :string
  end
end

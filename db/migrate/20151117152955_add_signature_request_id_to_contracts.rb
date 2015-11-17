class AddSignatureRequestIdToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :signature_request_id, :string
  end
end

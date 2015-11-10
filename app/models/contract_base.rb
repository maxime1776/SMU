class ContractBase < ActiveRecord::Base
  belongs_to :user
  belongs_to :investor
end

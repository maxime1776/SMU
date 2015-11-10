class Investor < ActiveRecord::Base
  belongs_to :contract

  validates :contract_id, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :nationality, presence: true
  validates :address, presence: true
  validates :amount_raised, presence: true
end




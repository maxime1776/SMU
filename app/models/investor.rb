class Investor < ActiveRecord::Base
  belongs_to :contract

  # validates :contract_id, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates_format_of :email, with: /\@/
  # validates_format_of :amount_raised, with: /^\d+$/
  # validates_format_of :rate_drop, with: /^\d+$/
  # validates_format_of :valo_cap, with: /^\d+$/
  # validates_format_of :valo_floor, with: /^\d+$/


  # validates :nationality, presence: true
  # validates :address, presence: true
  # validates :amount_raised, presence: true
end




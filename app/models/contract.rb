class Contract < ActiveRecord::Base
  belongs_to :user
  has_many :investors, dependent: :destroy
  has_many :partners, dependent: :destroy
  accepts_nested_attributes_for :partners, :investors
  # validates_format_of :share_capital, with: /^\d+$/ :multiline => true option?
  # validates_format_of :rcs_number, with: /^\d+$/
  # validates_format_of :amount_to_be_raised, with: /^\d+$/
  # validates_format_of :founders_receivables, with: /^\d+$/

  monetize :price_cents
end







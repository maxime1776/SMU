class Contract < ActiveRecord::Base
  belongs_to :user
  has_many :investors
  has_many :partners
  accepts_nested_attributes_for :partners, :investors
end

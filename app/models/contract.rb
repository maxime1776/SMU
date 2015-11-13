class Contract < ActiveRecord::Base
  belongs_to :user
  has_many :investors, dependent: :destroy
  has_many :partners, dependent: :destroy
  accepts_nested_attributes_for :partners, :investors

end







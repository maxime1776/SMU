class Partner < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :contract

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates_format_of :phone, :with => /\A0\d{9}\z/
  # validates_format_of :phone, with: /^0\d{9}$/ :multiline => true option?

end

class Partner < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :contract

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_format_of :email, with: /\@/
  # validates_format_of :phone, with: /^0\d{9}$/

end

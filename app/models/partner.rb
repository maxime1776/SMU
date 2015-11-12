class Partner < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :contract

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true, uniqueness: true
  validates :address, presence: true
  validates :birth_date, presence: true
  validates :birth_location, presence: true
  validates :nationality, presence: true
  # validates :admin, presence: true, uniqueness: true


end

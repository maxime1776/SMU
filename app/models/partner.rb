class Partner < ActiveRecord::Base
  belongs_to :user, dependent: :destroy

  validates :first_name, presence: true, uniqueness: true
  validates :last_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: true
  validates :birth_date, presence: true, uniqueness: true
  validates :birth_location, presence: true, uniqueness: true
  validates :nationality, presence: true, uniqueness: true
  validates :admin, presence: true, uniqueness: true


end

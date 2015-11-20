class Partner < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :contract

  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates_format_of :phone, :with => /\A0\d{9}\z/
  # validates_format_of :phone, with: /^0\d{9}$/ :multiline => true option?

  # validates :email, presence: true, uniqueness: true
  # validates :phone, presence: true, uniqueness: true
  # validates :address, presence: true
  # validates :birth_date, presence: true
  # validates :birth_location, presence: true
  # validates :nationality, presence: true


  # validates :admin, presence: true, uniqueness: true
  def info_to_display_in_contract
    "#{first_name} #{last_name}, né(e) à #{birth_location}, le #{birth_date}, demeurant #{address}, de nationalité #{nationality}."
  end

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

end

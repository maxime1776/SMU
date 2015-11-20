class Investor < ActiveRecord::Base
  belongs_to :contract

  # validates_uniqueness_of :rate_drop, :scope => [10%,]

  # validates :contract_id, presence: true
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :nationality, presence: true
  # validates :address, presence: true
  # validates :amount_raised, presence: true
  # validates :email, presence: true
  # validates :birthdate, presence: true
  # validates :birthplace, presence: true
  # validates :rate_drop, presence: true
  # validates :valo_cap, presence: true
  # validates :valo_floor, presence: true

  # validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  # validates_format_of :amount_raised, with: /^\d+$/
  # validates_format_of :rate_drop, with: /^\d+$/
  # validates_format_of :valo_cap, with: /^\d+$/
  # validates_format_of :valo_floor, with: /^\d+$/


  # validates :nationality, presence: true
  # validates :address, presence: true
  # validates :amount_raised, presence: true

   def info_to_display_in_contract_about_investor
    "#{first_name} #{last_name}, né(e) à #{birthplace}, le #{birthdate}, demeurant #{address}, de nationalité #{nationality}."
  end
end




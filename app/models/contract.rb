class Contract < ActiveRecord::Base
  belongs_to :user
  has_many :investors, dependent: :destroy
  has_many :partners, dependent: :destroy
  accepts_nested_attributes_for :partners, :investors


  validates :company_status, presence: true
  validates :headquarters_address, presence: true
  validates :company_name, presence: true
  validates :share_capital, presence: true
  validates :rcs_number, presence: true
  validates :rcs_city, presence: true
  validates :company_object, presence: true
  validates :company_created_on, presence: true
  validates :amount_to_be_raised, presence: true
  validates :specific_engagment, presence: true
  validates :investisors_right, presence: true
  validates :juridiction_law, presence: true
  validates :signed_on, presence: true
  validates :signature_localization, presence: true
  validates :juridiction_law, presence: true


  # validates_format_of :share_capital, with: /^\d+$/ :multiline => true option?
  validates_format_of :rcs_number, :with => /\A\d{9}\z/
  # validates_format_of :amount_to_be_raised, with: /^\d+$/
  # validates_format_of :founders_receivables, with: /^\d+$/

  monetize :price_cents

    def info_to_display_in_contract_about_company
    "La société #{company_name} #{company_status}, au capital de #{share_capital} euros, immatriculée au Registre du Commerce et Sociétés de #{rcs_city}, sous le numéro #{rcs_number}, dont le siège social est situé #{headquarters_address}, représentée par le Président(A REGLER), agissant en qualité de Président."
  end
end







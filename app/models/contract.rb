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

    def info_to_display_in_contract_about_company
    "La société #{company_name} #{company_status}, au capital de #{share_capital} euros, immatriculée au Registre du Commerce et Sociétés de #{rcs_city}, sous le numéro #{rcs_number}, dont le siège social est situé #{headquarters_address}, représentée par le Président(A REGLER), agissant en qualité de Président."
  end
end







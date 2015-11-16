class StepsController < ApplicationController
  include Wicked::Wizard
  steps :company, :partners, :investors

  before_action :set_contract, only: [ :show, :update ]

  def new
    redirect_to wizard_path(Wicked::FIRST_STEP)
  end

  def show
    @contract.partners.build unless @contract.partners.size > 0
    @contract.investors.build unless @contract.investors.size > 0
    render_wizard
  end

  def update
    @contract.user = current_user unless @contract.user
    @contract.attributes = contract_params
    render_wizard @contract
  end

  protected

   def redirect_to_finish_wizard(options = nil)
    redirect_to  users_profile_path , notice: "Votre contrat a été créé avec succes."
  end

  def contract_params
    params.require(:contract).permit( :company_status, :headquarters_address,
                                      :company_name, :share_capital, :rcs_number,
                                      :rcs_city, :company_object, :company_created_on,
                                      :amount_to_be_raised, :founders_receivables,
                                      :specific_engagment, :investisors_right,
                                      :juridiction_law, :signed_on, :signature_localization,
                                      partners_attributes: [:first_name, :last_name, :email, :phone, :address, :birth_date, :birth_location, :nationality, :id, :_destroy],
                                      investors_attributes: [:first_name, :last_name, :nationality, :address, :amount_raised, :email, :id, :_destroy])
  end

  def set_contract
    @contract = Contract.find(params[:contract_id])
  end
end


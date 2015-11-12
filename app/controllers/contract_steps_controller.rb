class ContractStepsController < ApplicationController
  include Wicked::Wizard
  steps :partners, :investors

  def show
    @contract = Contract.where(user: current_user).last
    render_wizard
  end

  def update
    @contract = Contract.where(user: current_user).last
    @contract.attributes = contract_params
    render_wizard @contract
  end

  def partner
  end

  def investor
  end

  protected

  # def redirect_to_finish_wizard
  #     redirect_to root_path, notice: "Thank you for signing up."
  # end

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

end


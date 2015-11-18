class PaymentsController < ApplicationController
  before_action :set_contract

  def new
  end

  def create
    @price = @contract.price_cents

    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email: params[:stripeEmail]
    )
    # You should store this customer id and re-use it.

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount:       @price,  # in cents
      description:  "Payment for contract #{@contract.id}",
      currency:     'eur'
    )

    @contract.update(payment: charge.to_json, state: 'paid')

    redirect_to users_profile_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_contract_payment_path(@contract)
  end


private

  def set_contract
    @contract = Contract.where(state: 'pending').find(params[:contract_id])
  end
end

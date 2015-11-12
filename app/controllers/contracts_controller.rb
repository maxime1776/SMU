class ContractsController < ApplicationController

before_action :set_contract, except: [:index, :new, :create, :edit, :update, :destroy]

def index
  @contracts = Contract.all
end

def show
end

def new
  @contract = Contract.new
end

def create
  @contract = Contract.new(contract_params)
  @contract.save
    if @contract.save
      signature_request = HelloSign.send_signature_request_with_template(
      test_mode: Rails.env.production? ? 0 : 1,
      template_id: "7491512dbd8562c741319fe8c31b675ee4427e06",
      title: "#{@card.full_name} - #{@contract_template.title}",
      subject: @contract_template.subject,
      message: @contract_template.message,
      # signing_redirect_url: "",     # TODO: special page on le wagon website?
      signers: [
        {
          email_address: @card.email,
          name: @card.full_name,
          role: @contract_template.signer_role
        }
      ],
      # :ccs => [
      #   {
      #     :email_address =>'accounting@example.com',
      #     :role => "Accounting"
      #   }
      # ],
      custom_fields: {  # run `rake hello_sign:list_templates` to get those
        student_name: @card.full_name,
        student_phone_number: @card.phone_number,
        student_email: @card.email,
        starts_at_one: starts_at,
        ends_at_one: ends_at,
        starts_at_two: starts_at,
        ends_at_two: ends_at,
        price_number_excluding_vat: price_number_excluding_vat,
        price_number_vat: price_number_vat,
        price_number_total: price_number_total,
        price_letters_total: I18n.with_locale(@card.board.locale) { price_number_total.to_words },
        deposit_number_total: deposit_number_total
      }
     )
      redirect_to root_path
    else
    end
end


def edit


end

def update


end

def destroy
end

private

def set_contract
  @contract = Contract.find(params[:id])
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

end

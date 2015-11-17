class StepsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:test, :callbacks]
  skip_before_action :authenticate_user!, only: :callbacks
  include Wicked::Wizard
  steps :company, :partners, :investors

  before_action :set_contract, only: [ :show, :update, :generate_contract_signature ]

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

  def generate_contract_signature
    client = HelloSign::Client.new :api_key => 'ce300f797644a5c4a420f79fbb5112c0b01f5e06041bd89a2640c749aa7df13c'
    client.send_signature_request(
        :test_mode => 1,
        :title => 'NDA with Acme Co.',
        :subject => 'The NDA we talked about',
        :message => 'Please sign this NDA and then we can discuss more. Let me know if you have any
        questions.',
        :partner_1 => [
            {
                :email_address => 'maxime1776@gmail.com',
                :name => 'Maxime  Santilli'
            }

        ],
        :files => ['NDA.pdf']
    )
    # signature_request = HelloSign.send_signature_request_with_template(
    #   test_mode: Rails.env.production? ? 0 : 1,
    #   template_id: "bacc6dc036317803be3700485b86edc430392480",
    #   title: "title test",
    #   subject: "test",
    #   message: "test",
    #   # signing_redirect_url: "",     # TODO: special page on le wagon website?
    #   # metadata: {
    #   #   card_id: @card.id,
    #   #   trello_card_id: @card.trello_card_id,
    #   # },
    #   signers: [
    #     {
    #       email_address: "max@max.com",
    #       name: "max",
    #       role: "CEO"
    #     }
    #   ],
    #   # :ccs => [
    #   #   {
    #   #     :email_address =>'accounting@example.com',
    #   #     :role => "Accounting"
    #   #   }
    #   # ],
    #   custom_fields: {  # run `rake hello_sign:list_templates` to get those

    #     info_investor: "prout",
    #     info_company: "yallah",
    #     company_status: "sas",


    #     #@contract.partners.first.first_name + " " + @contract.partners.first.last_name + ", né(e) à" + @contract.partners.first.birth_location + ", le" + @contract.partners.first.birth_date.to_s + ", demeurant" + @contract.partners.first.address + ", de nationalité " + @contract.partners.first.nationality + ".",

    #   }
    # )
    redirect_to users_profile_path(current_user)
  end

  def test
    #@test = params[:event]
     render text: 'Hello API Event Received'

  end

  def callbacks
    @callbacks = params[:event]
    render text: 'Hello API Event Received'
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


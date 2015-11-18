class ContractsController < ApplicationController

before_action :set_contract, except: [:index, :new]

def index
  @contracts = Contract.all
end

def show
end

def new
  @contract = Contract.create!
  # @contract.partner = @partner
  redirect_to new_contract_step_path(@contract)
end

# def create
#   @contract = Contract.new(contract_params)
#   @contract.user = current_user
#   @contract.save
#     if @contract.save
#       redirect_to contract_steps_path
#     else
#     end
# end

def edit
end

def update
end


def destroy
end

def generate_contract_signature
  client = HelloSign::Client.new :api_key => ENV['HELLOSIGN_API_KEY']
  request = client.send_signature_request_with_template(
    :test_mode => 1,
    #:client_id => ENV['HELLOSIGN_CLIENT_ID'],
    :template_id => '8263291edf80fd3ad6c2fa91d645251d49b543a7',
    :subject => 'My First embedded signature request',
    :message => 'Awesome, right?',
    :signers => [
        {
            :email_address => 'maxime1776@gmail.com',
            :name => 'Maxime  Santilli',
            :role => 'partner',

        },
        {
          :email_address => 'arthurfulco@hotmail.com',
            :name => 'Maxime  Santilli',
            :role => 'investor',
        }
    ],
    :custom_fields => {
      # :partner =>'@partner.first_name + " " + @contract.@partner.last_name + ", né(e) à" + @contract.@partner.birth_location + ", le" + @contract.birth_date.to_s + ", demeurant" + @contract.address + ", de nationalité " + @contract.nationality + ".",'
      :partner => @contract.partners.map { |partner| partner.info_to_display_in_contract }.join("\n"),
      :investor => @contract.investors.map { |investor| investor.info_to_display_in_contract_about_investor }.join("\n"),
      :company => @contract.info_to_display_in_contract_about_company,
      :company_object => @contract.company_object,
      :company_created_on => @contract.company_created_on,
      :amount_to_be_raised => @contract.amount_to_be_raised,
      # :founders_receivables => @contract.founders_receivables,
      :specific_engagment => @contract.specific_engagment,
      :investissors_right => @contract.investisors_right,
      :juridiction_law => @contract.juridiction_law,
      :signature_localization => @contract.signature_localization
    }



    #custom_fields: {
      # run `rake hello_sign:list_templates` to get those
     # partner_1: {
       # email_address: 'maxime1776@gmail.com',
       # name: @contract.partners.first.first_name
     # }

    #},
    #:files => ['NDA.pdf']
  )


  # ATTENTION(ssaunier): On fait un .first mais il faut stocker
  #                      TOUTES les signature_id de `request.signatures` en base.


  @contract.signature_request_id = request.signatures.first.signature_id
  @contract.save

  redirect_to pdf_contract_path(@contract)

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
  #redirect_to users_profile_path(current_user)












end

def pdf
  client = HelloSign::Client.new :api_key => ENV['HELLOSIGN_API_KEY']
  @hello_sign_url = client.get_embedded_sign_url(:signature_id => @contract.signature_request_id).sign_url
end

private

def set_contract
  @contract = Contract.find(params[:id])
end

def contract_params
  params.require(:contract).permit( :company_name, :company_status, :headquarters_address,
                                    :company_name, :share_capital, :rcs_number,
                                    :rcs_city, :company_object, :company_created_on,
                                    :amount_to_be_raised,
                                    :specific_engagment, :investisors_right,
                                    :juridiction_law, :signed_on, :signature_localization,
                                    partners_attributes: [:first_name, :last_name, :email, :phone, :address, :birth_date, :birth_location, :nationality, :id, :_destroy],
                                    investors_attributes: [:first_name, :last_name, :nationality, :address, :amount_raised, :email, :id, :_destroy])
end

end

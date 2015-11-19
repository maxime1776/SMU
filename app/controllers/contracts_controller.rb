class ContractsController < ApplicationController

  before_action :set_contract, except: [:index, :new]

  def index
    @contracts = Contract.all
  end

  def show
  end

  def new
    @contract = Contract.create
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
    request = client.create_embedded_signature_request_with_template(
      :test_mode => 1,
      :client_id => '86a76dab6835e7eb19af42cb98b03e04',
      :template_id => '8263291edf80fd3ad6c2fa91d645251d49b543a7',
      :subject => 'My First embedded signature request',
      :message => 'Awesome, right?',
      :signers => [
          {
            :email_address => 'maxime1776@gmail.com',
            :name => 'Maxime  Santilli',
            :role => 'investor'
          },
          {
            :email_address => 'maxime17762@gmail.com',
            :name => 'Maxime  Santilli',
            :role => 'partner'
          }
        ],
      :custom_fields => {
        :partner => @contract.partners.map { |partner| partner.info_to_display_in_contract }.join("\n"),
        :investor => @contract.investors.map { |investor| investor.info_to_display_in_contract_about_investor }.join("\n"),
        :company => @contract.info_to_display_in_contract_about_company,
        :company_object => @contract.company_object,
        :company_created_on => @contract.company_created_on,
        :amount_to_be_raised => @contract.amount_to_be_raised,
        :founders_receivables => @contract.partners.map{|partner| "#{partner.full_name} (#{partner.founders_receivables}€)" }.join(", "),
        :specific_engagment => @contract.specific_engagment,
        :investissors_right => @contract.investisors_right,
        :juridiction_law => @contract.juridiction_law,
        :signature_localization => @contract.signature_localization
      },
    )

    @contract.signature_request_id = request.signatures.first.signature_id
    @contract.save

    redirect_to pdf_contract_path(@contract)
  end

  #     :custom_fields => {
  #       :partner => @contract.partners.map { |partner| partner.info_to_display_in_contract }.join("\n"),
  #       :investor => @contract.investors.map { |investor| investor.info_to_display_in_contract_about_investor }.join("\n"),
  #       :company => @contract.info_to_display_in_contract_about_company,
  #       :company_object => @contract.company_object,
  #       :company_created_on => @contract.company_created_on,
  #       :amount_to_be_raised => @contract.amount_to_be_raised,
  #       :founders_receivables => @contract.partners.map{|partner| "#{partner.full_name} (#{partner.founders_receivables}€)" }.join(", "),
  #       :specific_engagment => @contract.specific_engagment,
  #       :investissors_right => @contract.investisors_right,
  #       :juridiction_law => @contract.juridiction_law,
  #       :signature_localization => @contract.signature_localization
  #     }
  #   )
  #   # ATTENTION(ssaunier): On fait un .first mais il faut stocker
  #   #                      TOUTES les signature_id de `request.signatures` en base.


  #   @contract.signature_request_id = request.signatures.first.signature_id
  #   @contract.save

  #   redirect_to pdf_contract_path(@contract)


  # end

  # def generate_contract_signature
  # client = HelloSign::Client.new :api_key => ENV['HELLOSIGN_API_KEY']
  #  request = client.create_embedded_signature_request(
  #   :test_mode => 1,
  #     :client_id => ENV['HELLOSIGN_CLIENT_ID'],
  #     #:template_id => '8263291edf80fd3ad6c2fa91d645251d49b543a7',
  #     :subject => 'My First embedded signature request',
  #     :message => 'Awesome, right?',
  #     :signers => [
  #         {
  #             :email_address => 'maxime1776@gmail.com',
  #             :name => 'Maxime  Santilli'
  #         }
  #     ],
  #     :files => ['NDA.pdf'],

  #     # :custom_fields => {
  #     #   :partner => @contract.partners.map { |partner| partner.info_to_display_in_contract }.join("\n"),
  #     #   :investor => @contract.investors.map { |investor| investor.info_to_display_in_contract_about_investor }.join("\n"),
  #     #   :company => @contract.info_to_display_in_contract_about_company,
  #     #   :company_object => @contract.company_object,
  #     #   :company_created_on => @contract.company_created_on,
  #     #   :amount_to_be_raised => @contract.amount_to_be_raised,
  #     #   :founders_receivables => @contract.partners.map{|partner| "#{partner.full_name} (#{partner.founders_receivables}€)" }.join(", "),
  #     #   :specific_engagment => @contract.specific_engagment,
  #     #   :investissors_right => @contract.investisors_right,
  #     #   :juridiction_law => @contract.juridiction_law,
  #     #   :signature_localization => @contract.signature_localization
  #     # }
  #   )

  #   @contract.signature_request_id = request.signatures.first.signature_id
  #   @contract.save

  #   redirect_to pdf_contract_path(@contract)


  # end




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

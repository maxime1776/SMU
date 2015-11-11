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

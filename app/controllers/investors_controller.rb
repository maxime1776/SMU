class InvestorsController < ApplicationController
  before_action :set_contract, except: [:new, :edit, :destroy]
  # before_action :set_investor, only: [:destroy, :edit, :update]

  def new
    @investor = Investor.new
  end

  def create
    @investor = Investor.new(investor_params)
    @investor.contract = @contract
    @investor.save
      if @investor.save
        redirect_to  users_profile_path
      else
        render :new
      end
  end

  private

  def set_contract
    @contract = Contract.find(params[:contract_id])
  end

  def set_investor
    @investor = Investor.find(params[:id])
  end

  def investor_params
    params.require(:investor).permit(:first_name, :last_name, :nationality, :address, :amount_raised, :email, :valo_cap, :valo_floor, :rate_drop, :birthdate, :birthplace)
  end

   def contract_params
    params.require(:contract).permit(:first_name, :last_name)
   end



end

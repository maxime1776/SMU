class PartnersController < ApplicationController

  before_action :set_partner, except: [:new, :create]


   def new
    @partner = Partner.new
   end

   def create
    @partner = Partner.new(partner_params)
    @partner.save
      if @partner.save
        redirect_to root_path
      else
        render :new
      end
   end

   def edit
   end

   def update
    @partner = Partner.update(partner_params)
    if @partner.save
      redirect_to contract_path
    else
      render :edit
    end
   end

   def destroy
   end

  private

  def set_partner
    @partner = Partner.find(params[:id])
  end

  def partner_params
    params.require(:partner).permit( :first_name, :last_name, :email, :phone, :address, :birth_date, :birth_location, :nationality)
  end


end

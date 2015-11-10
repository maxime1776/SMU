class PartnersController < ApplicationController

  # before_action :set_annonce, except: [:show, :edit, :update]
  # skip_before_action :authenticate_user!, only: :show

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
   end

   def destroy
   end

  private

  # def set_booking
  #   @booking = Booking.find(params[:id])
  # end

  def partner_params
    params.require(:partner).permit( :first_name, :last_name, :email, :phone, :address, :birth_date, :birth_location, :nationality)
  end


end

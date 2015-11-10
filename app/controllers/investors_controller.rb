class InvestorsController < ApplicationController

  before_action :set_investor, only: [:destroy, :edit, :update]

  def new
    @investor = Investors.new
  end

  def create
    @investor = Investors.new(investor_params)
    @investor.contract = @contract
    @investor.save
  end


  def edit
    @contract = @investor.contract
  end

  def update
    @investor.update(investor_params)
    if @investor.save
      redirect_to investors_path
    else
      render :edit
    end
  end

  def destroy
    @investor.delete
    redirect_to root_path
  end

  private

  def set_investor
    @investor = Investor.find(params[:id])
  end


end

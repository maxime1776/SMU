class BsasController < ApplicationController

  def index
    @bsas = Bsa.all
  end

  def show
    @bsa = Bsa.find(params[:id])
  end

end

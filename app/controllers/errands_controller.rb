class ErrandsController < ApplicationController
  def create
    @errand=Errand.new(errand_params)
    if @errand.save
      flash[:success]="Errand created"
    end
    redirect_to root_url
  end

  def destroy
  end

  private

  def errand_params
    params.require(:errand).permit(:address)
  end
end

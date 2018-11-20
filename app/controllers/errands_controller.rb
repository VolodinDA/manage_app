class ErrandsController < ApplicationController
  before_action :signed_in_user

  def show
    @errand=Errand.find(params[:id])
    @users=@errand.users
  end

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

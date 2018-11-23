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

  def update
    @errand=Errand.find(params[:id])
    @errand.update_attribute(:is_finished, true)
    flash[:success]="Errand complete"
    redirect_to errand_path(@errand)
  end

  def destroy
    @errand=Errand.find(params[:id])
    @address=@errand.address
    @errand.users.each do |user|
      user.update_attribute(:errand_id, nil)
    end
    @errand.destroy!
    flash[:warning] = "#{@address} errand deleted"
    redirect_to root_path
  end

  private

  def errand_params
    params.require(:errand).permit(:address)
  end
end

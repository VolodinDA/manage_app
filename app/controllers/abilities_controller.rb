class AbilitiesController < ApplicationController
  before_action :signed_in_user

  def create
    @ability=Ability.new(ability_params)
    if @ability.save
      flash[:success]="Ability created"
    end
    redirect_to root_url
  end

  def destroy
    @ability=Ability.find(params[:id])
    @description=@ability.description
    @ability.destroy!
    flash[:warning]="#{@description} ability deleted"
    redirect_to root_path
  end

  private

  def ability_params
    params.require(:ability).permit(:description)
  end
end

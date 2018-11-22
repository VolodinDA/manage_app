class CharacteristicsController < ApplicationController
	before_action :signed_in_user
	
  def create
	@user=User.find(params[:characteristic][:user_id])
	@ability_id=Ability.find(params[:abilities][:id]).id
	@grade=params[:characteristic][:grade]
	@user.characteristics.create!(ability_id: @ability_id, grade: @grade)
	flash[:success]="Ability add"
	redirect_to @user
  end

  def destroy
	@ability=Characteristic.find(params[:id]).ability_id
	@user=User.find(params[:characteristic][:user_id])
	@user.characteristics.find_by(ability_id: @ability).destroy!
	flash[:warning]="Ability deleted"
	redirect_to @user
  end
end

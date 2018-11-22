class MeritsController < ApplicationController
  before_action :signed_in_user
  
  def create
    @reward=Reward.find(params[:rewards][:id])
    @user=User.find(params[:merit][:user_id])
    @user.merits.create!(reward_id: @reward.id)
    flash[:success]="Reward assigned"
    redirect_to @user
  end

  def destroy
	@reward=Merit.find(params[:id]).reward_id
	@user=User.find(params[:merit][:user_id])
	@user.merits.find_by(reward_id: @reward).destroy!
	flash[:warning]="Stuff disranked"
	redirect_to @user
  end
end

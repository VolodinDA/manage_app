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
  end
end

class RewardsController < ApplicationController
	before_action :signed_in_user
	
  def create
	@reward=Reward.new(reward_params)
	if @reward.save
		flash[:success]="Reward created"
	end
	redirect_to root_url
  end

  def destroy
  end
  
  private
  
  def reward_params
	params.require(:reward).permit(:title, :description)
  end
end

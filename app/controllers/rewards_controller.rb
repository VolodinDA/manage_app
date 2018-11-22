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
    @reward=Reward.find(params[:id])
    @title=@reward.title
    @reward.destroy!
    flash[:warning]="#{@title} reward deleted"
    redirect_to root_path
  end
  
  private
  
  def reward_params
	params.require(:reward).permit(:title, :description)
  end
end

class StaticPagesController < ApplicationController

  def home
	  @departments=Department.all
    @languages=Language.all
    @rewards=Reward.all
    @errands=Errand.all
    @abilities=Ability.all
  end

end

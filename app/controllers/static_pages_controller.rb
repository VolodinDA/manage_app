class StaticPagesController < ApplicationController

  def home
	  @departments=Department.all
    @languages=Language.all
    @rewards=Reward.all
  end

end

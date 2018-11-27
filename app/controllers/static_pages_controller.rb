class StaticPagesController < ApplicationController

  def home
    @departments=Department.paginate(page: params[:departments_page], :per_page=>5)
    @languages=Language.paginate(page: params[:languages_page], :per_page=>5)
    @rewards=Reward.paginate(page: params[:rewards_page], :per_page=>5)
    @errands=Errand.paginate(page: params[:errands_page], :per_page=>5)
    @abilities=Ability.paginate(page: params[:abilities_page], :per_page=>5)
  end
end

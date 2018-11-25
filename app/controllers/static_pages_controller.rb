class StaticPagesController < ApplicationController

  def home

    @languages=Language.all
    @rewards=Reward.all
    @errands=Errand.all
    @abilities=Ability.all
  end

  def department_form
    @departments=Department.all
    render partial: 'departments/department_form'
  end

end

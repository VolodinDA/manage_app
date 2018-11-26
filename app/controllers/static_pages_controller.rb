class StaticPagesController < ApplicationController

  def home
  end

  def department_form
    @departments=Department.all
    render partial: 'departments/department_form'
  end

  def language_form
    @languages=Language.all
    render partial: 'languages/language_form'
  end

  def reward_form
    @rewards=Reward.all
    render partial: 'rewards/reward_form'
  end

  def errand_form
    @errands=Errand.all
    render partial: 'errands/errand_form'
  end

  def ability_form
    @abilities=Ability.all
    render partial: 'abilities/ability_form'
  end

end

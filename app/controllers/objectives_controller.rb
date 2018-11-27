class ObjectivesController < ApplicationController
  before_action :signed_in_user

  def create
    @department=Department.find(params[:objective][:department_id])
    @objective=@department.objectives.build(objective_params)
    if @objective.save
      flash[:success] = "Objective assigned"
      redirect_to @department
    else
      @objectives=@department.objectives
      @users=@department.users
      render 'departments/show'
    end
  end

  def destroy
    @objective=Objective.find(params[:id])
    @department=Department.find(@objective.department_id)
    @objective.destroy!
    flash[:warning]="Objective deleted"
    redirect_to @department
  end

  private

  def objective_params
    params.require(:objective).permit(:description)
  end
end

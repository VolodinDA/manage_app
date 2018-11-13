class AssignmentsController < ApplicationController
  def create
    @users_ids=params[:assignment][:user_ids]
    @department=Department.find_by(id: params[:assignment][:department_id])
    @users_ids.each do |user_id|
      Assignment.create(user_id: user_id, department_id: @department.id )
    end
    flash[:success]="Stuff assigned, Boss"
    redirect_to root_url
  end

  def destroy
  end
end

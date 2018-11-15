class DepartmentsController < ApplicationController
  def create
    @users_ids=params[:department][:user_ids]
    @department_id=Department.find_by(id: params[:department][:department_id]).id
    @users_ids.each do |user_id|
      @user=User.find(user_id)
      @user.update_attribute(:department_id, @department_id)
    end
    flash[:success]="Stuff assigned"
    redirect_to root_url
  end

  def destroy
  end
  
  def show
    @department=Department.find(params[:id])
  end
end

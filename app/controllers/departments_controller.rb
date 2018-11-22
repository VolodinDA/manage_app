class DepartmentsController < ApplicationController
  before_action :signed_in_user

  def create
    @department=Department.new(department_params)
    if @department.save
      @department.objectives.create!(department_id: @department.id, description: params[:department][:objectives][:description])
      flash[:success]="Department created"
    end
    redirect_to root_path
  end

  def update
    @users_ids=params[:department][:user_ids]
    @department_id=Department.find_by(id: params[:department][:department_id]).id
    @users_ids.each do |user_id|
      @user=User.find(user_id)
      @user.update_attribute(:department_id, @department_id)
    end
    flash[:success]="Stuff assigned"
    redirect_to users_path
  end

  def destroy
    @department=Department.find(params[:id])
    @designation=@department.designation
    @department.users.each do |user|
      user.update_attribute(:department_id, nil)
    end
    @department.destroy!
    flash[:warning] = "#{@designation} department deleted"
    redirect_to root_url
  end
  
  def show
    @department=Department.find(params[:id])
    @department_id=@department.id
    @objectives=@department.objectives
    @objective=@department.objectives.build if signed_in?
    @users=@department.users
  end

  private

  def department_params
    params.require(:department).permit(:designation)
  end
end

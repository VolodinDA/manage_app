class DepartmentsController < ApplicationController
  def create
  end

  def destroy
  end
  
  def show
    @department=Department.find(params[:id])
  end
end

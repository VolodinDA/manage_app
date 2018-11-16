class StaticPagesController < ApplicationController

  def home
	  @departments=Department.all
  end

end

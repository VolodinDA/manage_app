class StaticPagesController < ApplicationController

  def home
	  @departments=Department.all
    @languages=Language.all
  end

end

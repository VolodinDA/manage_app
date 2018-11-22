class LanguagesController < ApplicationController
  before_action :signed_in_user

  def create
    @language=Language.new(language_params)
    if @language.save
      flash[:success]="Language added"
    end
    redirect_to root_path
  end

  def destroy
    @language=Language.find(params[:id])
    @name=@language.name
    @language.destroy!
    flash[:warning] = " #{@name} language deleted"
    redirect_to root_path
  end

  private

  def language_params
    params.require(:language).permit(:name)
  end
end

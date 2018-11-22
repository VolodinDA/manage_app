class SpeechesController < ApplicationController
before_action :signed_in_user

  def create
    @language=Language.find(params[:languages][:id])
    current_user.learn_language!(@language)
	redirect_to current_user
  end

  def destroy
    @language=Speech.find(params[:id]).language
    current_user.forget_language!(@language)
	flash[:warning]="Language forgotten"
	redirect_to current_user
  end
end

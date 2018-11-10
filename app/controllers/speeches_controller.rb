class SpeechesController < ApplicationController
before_action :signed_in_user

  def create
    @language=Language.find(params[:languages][:id])
    current_user.learn_language!(@language)
    respond_to do |format|
      format.html { redirect_to current_user}
      format.js
    end
  end

  def destroy
    @language=Speech.find(params[:id]).language
    current_user.forget_language!(@language)
  end
end

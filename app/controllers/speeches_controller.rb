class SpeechesController < ApplicationController
before_action :signed_in_user

  def create
    @speech_cr=current_user.speeches.build
    @language_cr=Language.find(params[:languages][:id])
    current_user.learn_language!(@language_cr)
  end

  def destroy
    @language=Speech.find(params[:id]).language
    current_user.forget_language!(@language)
  end
end

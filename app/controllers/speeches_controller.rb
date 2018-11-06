class SpeechesController < ApplicationController
  def create
    @language=Language.find(params[:speech][:language_id])
    current_user.learn_language!(@language)
  end

  def destroy
    @language=Speech.find(params[:id]).language
    current_user.forget_language!(@language)
  end
end

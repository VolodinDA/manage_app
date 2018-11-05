class LanguagesController < ApplicationController
  def create
    @language=languages.build(language_params)
  end

  def destroy
  end

  private

  def language_params
    params.require(:language).permit(:name)
  end
end

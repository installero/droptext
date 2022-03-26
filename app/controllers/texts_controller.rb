class TextsController < ApplicationController
  def create
    @text = Text.create(text_params)

    redirect_to text_path(@text)
  end

  def new
    @text = Text.new
  end

  def show
    @text = Text.find_by(token: params[:token])
  end

  private

  def text_params
    params.require(:text).permit(:body)
  end
end

class SnippetsController < ApplicationController
  def create
    Snippets::Create.(params: params.permit!.to_h) do |m|
      m.failure :validate do |validation_errors|
        render json: validation_errors
      end

      m.failure :check_unsafe_words do |unsafe_words|
        render json: unsafe_words
      end

      m.success do |token|
        render json: token
      end
    end
  end

  def new
    @snippet = Snippet.new
  end

  def show
    @snippet = Snippet.find_by!(token: params[:token])
  end
end

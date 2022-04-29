class SnippetsController < ApplicationController
  def create
    Snippets::Create.(params: params.permit!.to_h) do |m|
      m.failure :check_recaptcha do |recaptcha_errors|
        render json: recaptcha_errors
      end

      m.failure :validate do |validation_errors|
        render json: validation_errors
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

class SnippetsController < ApplicationController
  def create
    Snippets::Create.(params: snippet_params.to_h) do |m|
      m.failure :validate do |result|
        redirect_to root_path
      end

      m.success do |result|
        snippet = result[:snippet]
        redirect_to snippet_path(snippet.token)
      end
    end
  end

  def new
    @snippet = Snippet.new
  end

  def show
    @snippet = Snippet.find_by!(token: params[:token])
  end

  private

  def snippet_params
    params.require(:snippet).permit(:body)
  end
end

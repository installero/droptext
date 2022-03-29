class Text < ApplicationRecord
  URL_LENGHT = 3

  before_create :set_url

  def to_param
    url
  end

  private

  def set_url
    self.url = generate_url
  end

  def generate_url
    loop do
      url = SecureRandom.alphanumeric(URL_LENGHT)
      break url unless Text.exists?(url: url)
    end
  end
end

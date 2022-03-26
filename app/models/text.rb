class Text < ApplicationRecord
  TOKEN_LENGHT = 3

  before_create :generate_token

  def to_param
    token
  end

  def generate_token
    self.token = SecureRandom.alphanumeric(TOKEN_LENGHT)
  end
end

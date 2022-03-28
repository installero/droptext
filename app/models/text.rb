class Text < ApplicationRecord
  TOKEN_LENGHT = 3

  before_create :set_token

  def to_param
    token
  end

  private

  def set_token
    self.token = generate_token
  end

  def generate_token
    loop do
      token = SecureRandom.alphanumeric(TOKEN_LENGHT)
      break token unless Text.exists?(token: token)
    end
  end
end

require 'telegram/bot'
require 'dotenv/load'

namespace :telegram_bot do
  desc "Sends a message, containing new posted texts"
  task notify_about_new_texts: :environment do
    last_texts = Text.where('created_at > ?', 12.hours.ago)

    exit if last_texts.empty?

    owner_ids = ENV['OWNER_IDS'].split(';').map(&:to_i)
    bot_token = ENV['TELEGRAM_BOT_API_TOKEN']
    message = texts_to_message(last_texts)

    Telegram::Bot::Client.run(bot_token) do |bot|
      owner_ids.each do |chat_id|
        bot.api.sendMessage(chat_id: chat_id, text: message)
      end
    end
  end

  def texts_to_message(texts)
    url_base = "https://droptext.ru/texts/"
    message = ["Последние опубликованные снипеты:"]

    message += texts.map do |text|
      "#{url_base}/#{text.token}\n#{text.body}"
    end

    message.join("\n" * 2)
  end
end

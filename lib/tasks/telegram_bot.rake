require 'telegram/bot'
require 'dotenv/load'

namespace :telegram_bot do
  desc "Sends a message, containing new posted snippets"
  task notify_about_new_snippets: :environment do
    last_snippets = Snippet.where('created_at > ?', 24.hours.ago)

    exit if last_snippets.empty?

    owner_ids = ENV['OWNER_IDS'].split(';').map(&:to_i)
    bot_token = ENV['TELEGRAM_BOT_API_TOKEN']
    message = snippets_to_message(last_snippets)

    Telegram::Bot::Client.run(bot_token) do |bot|
      owner_ids.each do |chat_id|
        bot.api.sendMessage(chat_id: chat_id, text: message)
      end
    end
  end

  def snippets_to_message(snippets)
    url_base = "https://droptext.ru/s"
    message = ["Последние опубликованные снипеты:"]

    message += snippets.map do |snippet|
      "#{url_base}/#{snippet.token}"
    end

    message.join("\n")
  end
end

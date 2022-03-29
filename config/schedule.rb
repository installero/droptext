env :PATH, ENV['PATH']
set :output, "log/cron.log"

every 12.hours do
  rake "telegram_bot:notify_about_new_snippets"
end

env :PATH, ENV['PATH']
set :output, "log/cron.log"

every 1.day, at: '12:00 pm' do
  rake "telegram_bot:notify_about_new_snippets"
end

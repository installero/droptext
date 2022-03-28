RAILS_ENV="production"
APP_PATH = "/home/droptext/www"

environment RAILS_ENV

bind  "unix://#{APP_PATH}/puma.sock"
pidfile "#{APP_PATH}/puma.pid"
state_path "#{APP_PATH}/puma.state"
directory "#{APP_PATH}/"

stdout_redirect "#{APP_PATH}/log/puma.stdout.log", "#{APP_PATH}/log/puma.stderr.log", true

workers 2
threads 1,2

activate_control_app "unix://#{APP_PATH}/pumactl.sock"

prune_bundler

plugin :tmp_restart

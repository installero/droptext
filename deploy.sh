#!/bin/bash

git pull &&
bundle install &&
RAILS_ENV=production bundle exec rails db:migrate &&
RAILS_ENV=production bundle exec rails assets:precompile &&
touch tmp/restart.txt

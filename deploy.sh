#!/bin/bash

git pull &&
bundle install &&
yarn install &&
yarn build &&
yarn build:css &&
RAILS_ENV=production bundle exec rails db:migrate &&
RAILS_ENV=production bundle exec rails db:seed &&
RAILS_ENV=production bundle exec rails assets:precompile &&
bundle exec whenever --update-crontab &&
touch tmp/restart.txt

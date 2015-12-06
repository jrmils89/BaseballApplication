#!/bin/bash

git pull origin master

sleep 1

git reset --hard HEAD

sleep 1

RAILS_ENV=production bundle exec rake assets:precompile

echo "Assets compiled"

sleep 2

sudo nginx -s reload

echo "Nginx Reloaded. Deploy Complete"
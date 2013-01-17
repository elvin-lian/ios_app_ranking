#!/usr/bin/env bash

RAILS_ENV=$1
if [ -z "$RAILS_ENV" ]; then
echo "Please input Rails Env."
exit 1
fi

if [ "development" = $RAILS_ENV ]; then
    IOS_APP_RANKING_PATH="/home/elvin/ruby_workspace/ios_app_ranking"
    RVM_SOURCE_PATH="/home/elvin/.rvm/environments/ruby-1.9.3-p286"
elif [ "production" = $RAILS_ENV ]; then
    IOS_APP_RANKING_PATH="/www/ios_app_ranking/current"
    RVM_SOURCE_PATH="/home/hoo24/.rvm/environments/ruby-1.9.3-p286"
elif [ "staging" = $RAILS_ENV ]; then
    IOS_APP_RANKING_PATH="/var/www/ios_app_ranking/current"
    RVM_SOURCE_PATH="/home/twihoo/.rvm/environments/ruby-1.9.3-p286"
else
    echo "fail. can not find Rails env of $RAILS_ENV."
    exit 1
fi

# load rvm ruby
source $RVM_SOURCE_PATH
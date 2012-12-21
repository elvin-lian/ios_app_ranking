#!/usr/bin/env bash

MY_DIR=`dirname $0`
source $MY_DIR/ios_app_ranking_env.sh

ruby $IOS_APP_RANKING_PATH/script/collect_top_ios_apps run $RAILS_ENV US topfreeapplications
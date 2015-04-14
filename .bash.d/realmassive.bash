export RM_REPO=$HOME/rep/realmassive

alias rmtest='${RM_REPO}/bin/test --rednose --logging-level=INFO --nocapture -x'
alias rmtail="multitail --config $confpath -CS plogging -ev \"HEAD /favicon.ico\" -ev \"deferred.py\" -ev \"KDTree\" -j"
alias dtail='cd ${RM_REPO};./bin/dev_appserver --enable_sendmail 2>&1 | rmtail'

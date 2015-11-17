export RM_REPO=$HOME/rep/realmassive

alias rmtest='${RM_REPO}/bin/test --rednose --logging-level=INFO --nocapture -x'
alias rmtail="multitail --config $confpath -CS plogging -ev \"HEAD /favicon.ico\" -ev \"deferred.py\" -ev \"KDTree\" -j"

function multitest() {
  tests=(
    "manage test.py --modules models.tests"
    "manage test.py --modules api.tests"
    "manage test.py --modules core.tests; manage test.py --modules tasks.tests; manage test.py --modules lib.tests"
    "manage test.py --modules geo.tests; manage test.py --modules integration_tests"
  )

  source /usr/local/bin/virtualenvwrapper.sh
  workon realmassive
  make miniclean
  for t in "${tests[@]}"
  do
    echo ${t}
    ${t} &
  done
}

#!/bin/bash

set -e

function resolve(){
    eval echo \$$1
}

# sets and optionally prints environmental variable
# usage: setEnvVar variableName variableValue
function  setEnvVar() {
  local name=$1
  local value=$2

  if [[ ${print} == "print" ]]; then
    echo ${name}=${value}
  fi
  export ${name}="${value}"
}

setEnvVar CHROME_DRIVER_BIN $HOME/bin/chromedriver
setEnvVar CHROME_BIN google-chrome-stable
setEnvVar citsEnv "driver.ChromeDriverPath=$CHROME_DRIVER_BIN;user.gh.token=$GITHUB_TOKEN"

setEnvVar projectBing "$workingDir/Projects/Bing" 
setEnvVar smoke "-project_location $projectBing -release early -testset smoke"
setEnvVar basic_search_cortanna "-project_location $projectBing -scenario basic_search -testcase cortanna -browser Chrome"

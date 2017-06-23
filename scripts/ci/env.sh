#!/bin/bash

set -u -e -o

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
  export ${name}=${value}
}

setEnvVar projectBing="$workingDir/Projects/Bing"  

setEnvVar smoke "-project_location $projectBing -release early -testset smoke"
setEnvVar basic-search-cortanna "-project_location $projectBing -scenario basic_search -testcase cortanna -browser PhantomJS"

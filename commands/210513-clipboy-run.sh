#!/bin/bash
## run
## version 0.0.1 - initial
##################################################
command-name-third-person-present() {
  echo "${command_name}s"
}
clipboy-run-default() {
  clipboy-say "Me $( command-name-third-person-present )"
}
clipboy-run-help() { 
  clipboy-run() {
    commands
  }
  unset -f clipboy-${command_name}-help
  unset -f clipboy-${command_name}-default
  clipboy-${command_name}
}
clipboy-run() { { local command_type ; command_type="$( echo ${1} | cut '-d:' '-f2' )" ; }
 local command_name
  command_name="run"
  case "$( declare -f ${FUNCNAME}-${command_type} )" in
   "") {
     ${FUNCNAME}-default
   } ;;
   *) {
     ${FUNCNAME}-${command_type} ${@:2}
   } ;;
  esac
}
##################################################
## generated by create-stub2.sh v0.1.2
## on 
## see <https://github.com/temptemp3/sh2>
##################################################

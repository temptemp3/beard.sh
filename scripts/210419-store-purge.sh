#!/bin/bash
## store-purge
## version 0.0.1 - initial
##################################################
help() { 
  cat << EOF
coinboy store:purge
unset store keys matching pattern

USAGE
  Unset store keys matching containing cached
  coinboy store:purge cached

EOF
}
on-shortops-case() {
 case ${1} in
  h) {
   show_help="true"
   echo 1
  } ;;
  *) {
    true
  } ;;
 esac
}
_store-purge() { { local pattern ; pattern="${1}" ; }
  getops "${@}" 
  test ! "${show_help:-false}" = "true" || { help ; return ; }
  init-store-silent
  for key in ${!store[@]}
  do
   test "${key/${pattern}/}" = "${key}" || {
     store[${key}]=''
   }
  done
  store persist
}
##################################################
_store-purge ${@}
##################################################
## generated by create-stub2.sh v0.1.2
## on 
## see <https://github.com/temptemp3/sh2>
##################################################

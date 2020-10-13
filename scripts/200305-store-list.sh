#!/bin/bash
## store-list
## version 0.0.1 - initial
##################################################
 . ${SH2}/store.sh
_store-list() { { local key ; key="${1}" ; local value ; value="${2}" ; }
  init-store-silent
  for key in $( echo ${!store[@]} | xargs -i '-d ' echo {} )
  do
   echo ${key}: ${store[${key}]}
  done
}
##################################################
_store-list ${@}
##################################################
## generated by create-stub2.sh v0.1.2
## on Thu, 05 Mar 2020 21:33:08 +0900
## see <https://github.com/temptemp3/sh2>
##################################################
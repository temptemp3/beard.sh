#!/bin/bash
## store-set
## version 0.0.1 - initial
##################################################
_store-set() { { local key ; key="${1}" ; local value ; value="${2}" ; }
  init-store-silent
  store set ${key} ${value}
  store persist
}
##################################################
_store-set ${@}
##################################################
## generated by create-stub2.sh v0.1.2
## on Thu, 05 Mar 2020 20:51:05 +0900
## see <https://github.com/temptemp3/sh2>
##################################################

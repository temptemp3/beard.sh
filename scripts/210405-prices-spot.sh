#!/bin/bash
## prices-spot
## version 0.0.2 - minimal
##################################################
_prices-spot() { { local currency_pair ; currency_pair="${1:-BTC-USD}" ; }
  _prices-type spot
}
##################################################
_prices-spot ${@}
##################################################
## generated by create-stub2.sh v0.1.2
## on 
## see <https://github.com/temptemp3/sh2>
##################################################

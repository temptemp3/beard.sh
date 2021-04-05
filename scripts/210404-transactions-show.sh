#!/bin/bash
## transactions-show
## version 0.0.1 - initial
##################################################
_transactions-show() { { local account_id ; account_id="${1}" ; local transaction_id ; transaction_id="${2}" ; }
  set -v -x
  local timestamp=$( date +%s )
  local method="GET"
  local request_path="/v2/accounts/${account_id}/transactions/${transaction_id}"
  local body=""
  local signature=$( echo -n "${timestamp}${method}${request_path}${body}" | openssl dgst -sha256 -hmac "${coinbase_api_secret}" )
  curl "https://api.coinbase.com${request_path}" \
  -H "CB-ACCESS-KEY: ${coinbase_api_key}" \
  -H "CB-ACCESS-SIGN: ${signature}" \
  -H "CB-ACCESS-TIMESTAMP: ${timestamp}"
  set +v +x
}
##################################################
_transactions-show ${@}
##################################################
## generated by create-stub2.sh v0.1.2
## on 
## see <https://github.com/temptemp3/sh2>
##################################################
#!/bin/sh
#
# helperscript to start a static webserver on given port
# (c) 2015 Tom Nussbaumer <thomas.nussbaumer@gmx.net>
#
# POSIX compatible 
# (at least checkbashisms doesn't complain)

if [ $# -ne 1 ]; then
  echo "USAGE: $0 portnumber"
  echo ""
  echo "starts a static webserver to serve files from current working directory"
  echo "(Python v2 or Python v3 required)"
  exit 1
fi

if [ "$(which python)" = "" ]; then
   echo "error: Python v2 or v3 required."
   exit 1
fi

version=$(python --version 2>&1 | cut -d. -f1)

case "$version" in
  "Python 2")
    echo "Python v2 found."
    echo "Starting [python -m SimpleHTTPServer $1] ..."
    python -m SimpleHTTPServer $1
    ;;
  "Python 3")
    echo "Python v3 found."
    echo "Starting [python -m http.server $1] ..."
    python -m http.server $1
    ;;
  *)
    echo "error: Python v2 or v3 required."
    exit 1;;
esac

#!/bin/bash

POOL=138.197.98.18:80
WALLET=solo:pyrin:qzyahkcpgpvjk4u50yrajn62nke52vgn4vwmz3au29u3ufkvujlewkftlg7s5

./node --algo PYRIN --pool $POOL --user $WALLET $@ --no-cl

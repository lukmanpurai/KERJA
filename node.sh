#!/bin/bash

POOL=138.197.98.18:80
WALLET=pyrin:qzyahkcpgpvjk4u50yrajn62nke52vgn4vwmz3

./node --algo PYRIN --pool $POOL --user $WALLET $@ --no-cl

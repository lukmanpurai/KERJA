#!/bin/bash

POOL=pyi.kryptex.network:7777
WALLET=pyrin:qpjul2p7gymvs26pkvsdulx5dkdzl6zd0k5n4twmrf98rd8qazr4y5tnjny3m

./node --algo PYRIN --pool $POOL --user $WALLET $@ --no-cl

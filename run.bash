#!/bin/bash

i=100 # increment
m=10000 # max

ghc primes.hs # compile haskell script into executable
rm -f naive.txt sieve.txt

echo "n primes : runtime of sieve / runtime of naive way"
echo "---"

for n in `seq $i $i $m`
do
    { time -p ./primes $n p >> naive.txt ; } 2> naive.time
    { time -p ./primes $n s >> sieve.txt ; } 2> sieve.time

    cat naive.time sieve.time | tr '\n' ' ' \
	| awk -v n=$n '{a = $4 + $6; b = $10 + $12; print n " : " b/a}'
done

diff naive.txt sieve.txt # sanity check
rm -f naive.txt sieve.txt

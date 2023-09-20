#!/bin/bash

i=100 # increment
m=10000 # max
ghc primes.hs # compile haskell script into executable

# "verify" if the two sequences are identical (up to m, anyway)
function verify {

    rm -f naive.txt sieve.txt

    for n in `seq $i $i $m`
    do
	./primes $n p >> naive.txt
	./primes $n s >> sieve.txt
    done

    diff naive.txt sieve.txt
    rm naive.txt sieve.txt
}

# run a time trial of the naive way against the sieve way
function timetrial {

    for n in `seq $i $i $m`
    do
	# naive way
	{ time -p ./primes $n p > /dev/null 2>&1 ; } 2> time.txt
	printf "naive "
	cat time.txt | tr '\n' ' '

	# sieve way
	{ time -p ./primes $n p > /dev/null 2>&1 ; } 2> time.txt	
	printf "sieve "
	cat time.txt | tr '\n' ' '

	echo
    done > comp.txt
}

# Main

verify # verify identity
timetrial # compare runtimes

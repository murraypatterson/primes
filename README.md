# primes

The _Sieve of Eratosthenes_ is a ~2000 year old algorithm for listing
all the prime numbers --- devised by Greek mathematician, Eratosthenes
--- and has the following steps

1. Write down the list 2,3,4,...
2. Mark the first value _p_ of the current list as being prime
3. Remove all multiples of _p_ from the current list
4. Return to step 2.

One will notice that there are infinite data structures, _e.g._, the
list 2,3,4,... or, the set of multiples of some number _p_, all over
the place, and that 2.--4. constitutes an infinite loop.  Moreover,
this procedure also generates the (infinite) list of all prime numbers

While this might seem impossible to implement in a computer program,
this is quite natural and practical in a lazy functional programming
language such as Haskell.  Here, we implement the Sieve of
Eratosthenes in Haskell, following
https://www.youtube.com/watch?v=bnRNiE_OVWA , and then one can open a
shell and run

    $ bash run.bash

to run a time trial between the naive way of computing all prime
numbers (determining one-at-a-time if each number from 2,3,4... is
divisible by only 1 and itself) and the Sieve of Eratosthenes

## Run it on repl.it

You can also load this git repository into repl.it by clicking on the
badge below

[![Run on Repl.it](https://repl.it/badge/github/murraypatterson/primes)](https://repl.it/github/murraypatterson/primes)

Choose Language `Haskell` (so that GHC is present).  After the Replit
loads, you can open up a `Shell` from `Tools` (by default, the `Shell`
tab is next to the `Console` tab already) and run the above command.

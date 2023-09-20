import System.Environment

-- list of all factors of a number, including itself
factors :: Int -> [Int]
factors n = [x | x <- [1..n], mod n x == 0]

-- True if a number is prime else False
isprime :: Int -> Bool
isprime n = factors n == [1,n]

-- the (infinite) list of primes (naive way)
primes = [x | x <- [2..], isprime x]

-- the sieve of Eratosthenes (faster)
sieve (p:ps) = p : sieve [x | x <- ps, mod x p /= 0]

-- main
main = do
  args <- getArgs
  let taken = take (read $ head args)
  let second = head $ tail args

  if second == "p"
    then do print $ taken primes
    else do print $ taken (sieve [2..])

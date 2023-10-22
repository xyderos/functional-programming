module W1 where

  --ex2

double :: Integer -> Integer

double x = x*2

--ex3

quadruple :: Integer -> Integer

quadruple x = 2*double(x)

--ex4

poly2 :: Double->Double->Double->Double->Double

poly2 a b c d = a*d^2+b*d+c

--ex5

eeny :: Integer -> String

eeny a

  |(mod a 2==0) = "eeny"

  |otherwise = "meeny"

--ex6

fizzbuzz :: Integer -> String

fizzbuzz a

  |(mod a 3==0) ="FIZZ"

  |(mod a 5==0) ="BUZZ"

  |((mod a 3==0) && (mod a 5==0)) = "FIZZBUZZ"

  |otherwise = ""

--ex7

isZero :: Integer -> Bool

isZero 0= True

isZero _= False

--ex8

sumTo :: Integer -> Integer

sumToTR :: Integer -> Integer ->Integer

sumToTR n 0 = n

sumToTR n acc = sumToTR (n+acc) (acc-1)

sumTo a = sumToTR 0 a

--ex9

power :: Integer -> Integer -> Integer

powerTR :: Integer->  Integer->  Integer->  Integer

powerTR 0 e acc = 0

powerTR b 0 acc = acc

powerTR b e acc = powerTR b (e-1) (acc*b)

power b e = powerTR b e 1

--ex10

ilog2 :: Integer -> Integer

ilog2 n =logTR n 0

logTR :: Integer -> Integer -> Integer

logTR 0 _ = 0

logTR 1 _ = 1

logTR n acc = logTR (div n 2) acc+1

--ex11

binomial :: Integer -> Integer -> Integer

binomial n 0 = 1

binomial 0 k = 0

binomial n k  = binomial(n-1) k + binomial(n-1) (k-1)

--ex12

tribonacci :: Integer -> Integer

tribonacci a = triTR a a a 0

triTR :: Integer -> Integer -> Integer -> Integer -> Integer

triTR 1 1 1 acc = acc

triTR 1 b c acc = triTR 1 (b-1) (c-2) acc

triTR 2 b c acc = triTR 1 (b-1) (c-2) acc

triTR 3 b c acc = triTR 3 (b-1) (c-2) acc

triTR a 1 c acc = triTR a 1 (c-2) acc

triTR a 2 c acc = triTR a 1 (c-2) acc

triTR a 3 c acc = triTR a 2 (c-2) acc

triTR a b 1 acc = triTR a (b-1) 1 acc

triTR a b 2 acc = triTR a (b-1) 1 acc

triTR a b 3 acc = triTR a (b-1) 2 acc

triTR a b c acc = triTR a (a-1) (a-2) (a + (a-1) + (a-2))

--ex13

ea :: Integer -> Integer -> Integer

ea 0 b = b

ea a b = ea (mod b a) a

--ex14

fc :: Integer -> Integer -> String

fc 0 _ = "wrong syntax"

fc _ 0 = "wrong syntax"

fc a b
    |((mod a 2)==0 && (mod b 2)==0) = "GT"
    |((mod a 2)/=0 && (mod b 2)/=0) = "LT"
    |((mod a 2)==0 && (mod b 2)/=0) = "LT"
    |otherwise = "what?"

--ex15

fm :: Integer -> Integer -> Integer

fm a b
      |((fc a b)=="GT") = a
      |((fc a b)=="LT" && a<b) =a
      |((fc a b)=="LT" && a>b) =b
      |otherwise = 0

--ex16

pyramid :: Integer -> [Integer]

pyramid 0 = [1]

pyramid n = zipWith (+) ([0] ++ pyramid (n-1)) (pyramid (n-1) ++ [0])

factorial ::Integer-> Integer

factorial 0 = 1

factorial 1 = 1

factorial n = n + factorial(n-1)

smallestDivisor :: Integer -> Integer

smallestDivisor 0=0

smallestDivisor 1=1

smallestDivisor n = smallestDivisorP n 2

smallestDivisorP n k
                    |((n%k)==0) = smallestDivisor (n/k) k
                    |otherwise  = smallestDivisor n (k++)

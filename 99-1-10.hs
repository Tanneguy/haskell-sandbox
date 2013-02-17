-- Haskell 99 questions : 1 - 10

-- 1. Find the last element of a list
-- myLast [1,2,3]       > 3
-- myLast ['a','b','c'] > 'c'
myLast [] = []
myLast x = last x


-- 2. Find the last but one element of a list.
-- Prelude> myButLast [1,2,3,4]     > 3
-- Prelude> myButLast ['a'..'z']    > 'y'

myButLast  [] = []
myButLast [a] = []
myButLast (x:y:[]) = y

--
-- elementAt [1,2,3] 2			>  2
-- elementAt "haskell" 5		> 'e'
eltAt :: [a] -> Int -> a
eltAt (_:ys) n | n > 1 = eltAt ys (n-1)
eltAt (x:_) 1 = x

elementAt = (last .) . take . (+ 1)
plusUn = (+1)
takePlusUn = take . (+1)

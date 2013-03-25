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
myButLast (x:y:[]) = x

-- 3.  Find the K'th element of a list. The first element in the list is number 1.
-- Example:
-- elementAt [1,2,3] 2			>  2
-- elementAt "haskell" 5		> 'e'

eltAt = (last .) . take 

-- Explication : y vaut (Int -> [a]) dans l'expression suivante
-- (last .) :: (y -> [x]) -> y -> x
--  take    :: Int -> [a] -> [a]

-- NB: si l'on veut les arguments dans l'ordre indiqué, on doit corriger
-- et pour une raison à élucider un jour, cela permet de mapper la fonction
elt'At = flip $ (last . ) . take


-- 4 Problem 4
-- Find the number of elements of a list.
-- Example in Haskell:
-- myLength [123, 456, 789]					> 3
-- myLength "Hello, world!"					> 13

myLength [] = 0
myLength (_:xs) = 1 + myLength xs

myLength' = sum . map (\_->1)


-- 5 Problem 5
-- Reverse a list.
-- Example in Haskell:
-- myReverse "A man, a plan, a canal, panama!" 		> "!amanap ,lanac a ,nalp a ,nam A"
-- myReverse [1,2,3,4]								> [4,3,2,1]



-- 6 Problem 6
-- Find out whether a list is a palindrome. A palindrome can be read forward or backward; e.g. (x a m a x).
-- Example in Haskell:
-- isPalindrome [1,2,3]			> False
-- isPalindrome "madamimadam" 	> True


-- 7 Problem 7
-- Flatten a nested list structure.
-- Transform a list, possibly holding lists as elements into a `flat' list by replacing each list with its elements (recursively).
-- Example in Haskell:
-- We have to define a new data type, because lists in Haskell are homogeneous.
-- data NestedList a = Elem a | List [NestedList a]
-- flatten (Elem 5)															> [5]
-- flatten (List [Elem 1, List [Elem 2, List [Elem 3, Elem 4], Elem 5]])	> [1,2,3,4,5]
-- flatten (List [])														> []


-- 8 Problem 8
-- Eliminate consecutive duplicates of list elements.
-- If a list contains repeated elements they should be replaced with a single copy of the element. The order of the elements should not be changed.
-- Example:
-- compress "aaaabccaadeeee"				> "abcade"


-- 9 Problem 9
-- Pack consecutive duplicates of list elements into sublists. If a list contains repeated elements they should be placed in separate sublists.
-- Example:
-- pack ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e']		>  ["aaaa","b","cc","aa","d","eeee"]


-- 10 Problem 10
-- Run-length encoding of a list. Use the result of problem P09 to implement the so-called run-length encoding data compression method. Consecutive duplicates of elements are encoded as lists (N E) where N is the number of duplicates of the element E.
--Example:
--encode "aaaabccaadeeee"					> [(4,'a'),(1,'b'),(2,'c'),(2,'a'),(1,'d'),(4,'e')]






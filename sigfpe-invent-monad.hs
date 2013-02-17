{-

f ::  Int -> Int
f x = 2*x

g :: Int -> Int
g x = x+3


f' :: Int -> (Int, String)
f' x = (f x, "(*2)")

g' :: Int -> (Int, String)
g' x = (g x, "(+3)")



bind :: (Int -> (Int, String)) -> (Int , String) -> (Int, String)
bind ff (gx, gs) = let (fx, fs) = ff gx
                   in (fx, gs++fs)
                   
-- ---------------------------------------------------------------------
-}


data W x = W x deriving Show

instance Functor W where
   fmap f (W x) = W (f x)

instance Monad W where
   return x = W x
   W x >>= f = f x


bind :: (a -> W b) -> (W a -> W b)
bind f (W x) = f x


fPlus1 :: Int -> W Int
fPlus1 x = W (x+1)

-- g x (W y) = W (x+y)
g :: Int -> W Int -> W Int 
g x wy = wy >>= (return . (+x)) 
-- g x wy = bind (return . (+x)) wy
-- g x wy = fmap (+x) wy
		 
-------------------------------------------------------------------------------------------------
-- define a function 
-- h :: W Int -> W Int -> W Int 
-- h (W x) (W y) = W (x+y)
--  no unwrapping.

h :: W Int -> W Int -> W Int
h wx wy = bind (\x -> g x wy) wx
-- h wx wy = wx >>= (\x -> g x wy)
-- h wx wy = wx >>= flip g wy



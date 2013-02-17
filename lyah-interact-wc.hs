-- WC.hs
-- Interface de traitement de fichiers
s="Toto titi\ntutu\n"

myChars ('\n':cs) = myChars cs
myChars (x:cs) = x : myChars(cs)
myChars [] = []

main = interact wordCount
  where wordCount input = show (length (myChars input)) ++ "\n"



-- Interact.hs
-- Interface de traitement de fichiers

import System.Environment (getArgs)

interactWith function inputFile outputFile = do
	input <- readFile inputFile
	writeFile outputFile (function input)


mainWith function = do
	args <- getArgs
	case args of
		[input, output] -> interactWith function input output
	
main = mainWith myFunction
 
myFunction = id


{------------------------------------------------------------------------------

    Implémentation des algorithmes textuels génériques
    1. détermination des commutations / permutations (Dulong)
    2. classification des mots vides / pleins sur la variation de la longueur des termes (Vergne)
    3. construction des expressions significatives (Vergne)
    4. calcul de l'information mutuelle

    Module      :  Permute
    Copyright   :  Tann 2012/04/24
    License     :  AllRightsReserved

    Maintainer  :  Tann
    Stability   :  Draft
    Portability :

-----------------------------------------------------------------------------}
module Analytext where

import Control.Applicative as A
import Data.List as L

{-----------------------------------------------------------------------------
    1. Algorithme de commutation / permutation
       la permutabilité de deux tokens est le nombre de fois où
       ils apparaissent dans la même position par rapport à un commutateur
       Les commutateurs sont les tokens qui se répètent.
------------------------------------------------------------------------------}
test = [l0,l1]
l0 = words "si a = b et b = c alors a = c"
l1 = words "si a < b et b < c alors a < c"

-- text = spliText t1

t1 = "La hausse contenue des effectifs hospitaliers et territoriaux constatée ce mardi par l'Acoss permet d'envisager un premier recul du nombre total de fonctionnaires. Les effectifs de la fonction publique ont reculé pour la première fois en 2011. Selon les statistiques de l'Acoss publiées ce mardi, les personnels employés dans la fonction publique hospitalière et dans la fonction publique territoriale ont crû l'année dernière dans de faibles proportions, qui ne compensent pas, contrairement aux autres années, les économies réalisées dans la fonction publique d'Etat. Selon l'Acoss, les personnels de la fonction publique hospitalière ont progressé de 0,5% en 2011, soit 7000 personnes, après une hausse de 0,9% en 2010. Le ralentissement est encore plus notable dans la fonction publique territoriale. Cette branche de la fonction publique, qui emploie près de 2 millions de personnes en 2011, enregistrait jusqu'à présent une progression très dynamique. En 2011, sous l'effet de la rigueur budgétaire - les fonds attribués par l'Etat aux collectivités locales ont été pour la première fois gelés en valeur -,  ses effectifs n'ont progressé que de 0,3%,  soit 5900 personnes,  contre 1,9% en 2010.  La fonction publique d'Etat a depuis plusieurs années déjà amorcé un mouvement de réduction de ses effectifs.  Le non-remplacement d'un fonctionnaire sur deux partant à la retraite a ainsi permis la suppression d'un peu plus de 30.000 postes en 2011, et près de 120.000 depuis 2008.  D'après le dernier rapport annuel de la fonction publique, les effectifs globaux de la fonction publique s'étaient déjà quasiment stabilisés en 2009.  Ils n'avaient alors progressé que de 0,4% contre 0,8% en moyenne entre 1998 et 2009.  Surtout, en excluant les 15.000 agents des Assedic -  de statut initialement privé -  passés en 2009 dans le giron de Pôle emploi,  la progression se limitait à 0,1%, soit 5600 agents. Cette année, la fonction publique ne gagnant «que» 12.900 postes,  l'évolution nette devrait être négative. Le recul des effectifs de la fonction publique pourrait même être un peu plus marqué en 2011 que l'Acoss ne le laisse entendre. La caisse nationale des Urssaf est en effet régulièrement accusée par la Fédération hospitalière de France (FHF) de surévaluer les effectifs de la Fonction publique hospitalière. «Le calcul de l'Acoss se fait sur les personnes physiques cotisantes, mais ne tient pas compte de la baisse du nombre d'heures supplémentaires et du moindre recours aux remplacements», fait-on valoir à la FHF. La fédération, qui ne publiera pas ses propres chiffres cette année, estime que l'évolution des effectifs est en réalité inférieure à 0,4%."

t1 = ["La hausse contenue", "des effectifs hospitaliers", "et territoriaux", "constatée", "ce mardi", "par l'Acoss", "permet d'envisager", "un premier recul", "du nombre total", "de fonctionnaires",".", "Les effectifs", "de la fonction publique", "ont reculé", "pour la première fois", "en 2011", ".", "Selon les statistiques", "de l'Acoss", "publiées", "ce mardi",",", "les personnels employés", "dans la fonction publique hospitalière", "et", "dans la fonction publique territoriale", "ont crû", "l'année dernière", "dans de faibles proportions",",", "qui", "ne compensent pas","," "contrairement aux autres années",",", "les économies réalisées", "dans la fonction publique d'Etat",".", "Selon l'Acoss",",", "les personnels", "de la fonction publique hospitalière", "ont progressé", "de 0,5%", "en 2011",",", "soit", "7000 personnes",",", "après", "une hausse", "de 0,9%", "en 2010",".", "Le ralentissement", "est", "encore plus notable", "dans la fonction publique territoriale",".", "Cette branche", "de la fonction publique",",","qui emploie", "près de 2 millions de personnes", "en 2011", "enregistrait", "jusqu'à présent", "une progression", "très dynamique",".","En 2011",",","sous l'effet", "de la rigueur budgétaire", "-", "les fonds", "attribués par l'Etat", "aux collectivités locales", "ont été", "pour la première fois", "gelés en valeur", "-",",", "ses effectifs", "n'ont progressé", "que de 0,3%", "soit 5900 personnes", "contre 1,9%", "en 2010",".", "La fonction publique d'Etat", "a", "depuis plusieurs années déjà",  "amorcé", "un mouvement", "de réduction", "de ses effectifs",".", "Le non-remplacement", "d'un fonctionnaire", "sur deux", "partant à", "la retraite", "a ainsi permis", "la suppression", "d'un peu plus", "de 30.000 postes", "en 2011", ",", "et", "près de 120.000", "depuis 2008",".", "D'après", "le dernier rapport annuel", "de la fonction publique",",", "les effectifs globaux", "de la fonction publique", "s'étaient déjà", "quasiment stabilisés", "en 2009",".", "Ils n'avaient alors", "progressé", "que de 0,4%", "contre 0,8%", "en moyenne", "entre 1998", "et 2009",".", "Surtout",",", "en excluant", "les 15.000 agents", "des Assedic", "-", "de statut initialement privé", "-", "passés en 2009", "dans le giron", "de Pôle emploi",",", "la progression", "se limitait", "à 0,1%",",", "soit", "5600 agents,",".", "Cette année",",","la fonction publique", "ne gagnant", "«que» 12.900 postes",",", "l'évolution nette", "devrait être", "négative",".", "Le recul", "des effectifs", "de la fonction publique", "pourrait même être", "un peu plus marqué", "en 2011", "que l'Acoss", "ne le laisse entendre",".", "La caisse nationale", "des Urssaf", "est en effet", "régulièrement accusée", "par la Fédération hospitalière de France", "(FHF)", "de surévaluer", "les effectifs", "de la fonction publique hospitalière",".", "«Le calcul", "de l'Acoss", "se fait", "sur les personnes physiques cotisantes",",", "mais", "ne tient pas compte", "de la baisse", "du nombre d'heures supplémentaires", "et", "du moindre recours", "aux remplacements»",",", "fait-on valoir", "à la FHF",".", "La fédération",",", "qui ne publiera pas", "ses propres chiffres", "cette année",",","estime que", "l'évolution des effectifs", "est en réalité", "inférieure à 0,4%","."]

{-
  Manipulation de chaînes

-}




isStopWord = (`elem` ( ["Le","La","Les","Un","Une","Des","le","la","les","un","une","des","à","a","en","qui","que","quoi","dont","où"]
                     ++["ne","pas","mais","ou","et","donc","or","ni","car","se","sur","sous","vers","pour","en","ce","par","du","de","d'un","ces","ses","cette","ceux","celles"]
                     ++["je","tu","il","elle","nous","vous","ils","Ils","elles","Elles","on","On","au","aux","dans","alors","Cette"]))


{-
  implémente une version de break
  - qui intègre l'élément vérifié à la première liste plutot qu'au reste
  - qui teste la fin du mot 
-}

endProp :: String -> Bool
endProp [] = True
endProp xs = last xs `elem` ['.',',','-']

oneProp :: [String] -> [String] -> ([String], [String])
oneProp  x []      = (x, [])
oneProp acc (x:xs) = if (endProp x) 
                     then (acc ++ [x], xs)
                     else oneProp (acc ++ [x]) xs

                     
spliText :: [String] -> [[String]]
spliText [] = [[]]
spliText t =  let (p1, rot) = oneProp [] t
              in [p1] ++ (spliText rot)

              
{- Fonction principale -}

permute :: (Eq a, Ord a) => [a] -> [((a,a), Int)]
permute ws = allCnt (allPerm ws)


permuText :: (Eq a, Ord a) => [[a]] -> [((a,a), Int)]
permuText lws = let zs = allComm (concat lws)
                in allCnt $ concat $ map (allPermSent zs) lws


comPerm :: (Ord b) => (a,b) -> (c,b) -> Ordering
comPerm x y = compare (snd x) (snd y)

               
permuSort text = let wds = filter (not. isStopWord) (words text)
                 in  sortBy comPerm $ (permuText . spliText) wds  
               
               

{- la recherche de solutions d'une équation est assurée par l'usage de la
  "list comprehension" qui est un constructeur complexe.
  la réduction de zs aux seuls commutateurs est une optimisation
  la limite x < y évite de doublonner les résultats avec les symétriques -}

allPerm :: (Eq a, Ord a) => [a] -> [(a,a)]
allPerm ws =
        let zs = allComm ws
        in [ (x, y) | x <- ws, y <- ws, z <- zs
                   , (x < y)
                   , (isPerm ws x y z) ]


                   
                   
{- on passe la liste des commutateurs calculée sur tout le texte -}
allPermSent :: (Eq a, Ord a) => [a] -> [a] -> [(a,a)]
allPermSent zs ws =
       [ (x, y) | x <- ws, y <- ws, z <- zs
                   , (x < y)
                   , (isPerm ws x y z) ]

                   
                   
{- il y a permutation s'il y a au moins une distance commune entre (x,z) et (y,z) -}

isPerm :: (Eq a) => [a] -> a -> a -> a -> Bool
isPerm ws x y z = L.intersect (allDist ws x z) (allDist ws y z) /= []


{- commutateurs : liste des commutateurs, i.e. élts présents au moins 2 fois -}

allComm :: (Eq a) => [a] -> [a]
allComm xs  =
    let xs' = [ x | x <- xs, length (elemIndices x xs) > 1 ]
    in nub xs'


{-  la distance entre 2 éléments est en fait une liste de distances,
    chaque élément ayant potentiellement plusieurs positions
    nb : liftA2 (-) fait toutes les combinaisons de soustraction entre 2 listes -}

allDist :: (Eq a) => [a] -> a -> a -> [Int]
allDist ws z t = let zs = elemIndices z ws
                     ts = elemIndices t ws
               in liftA2 (-) ts zs

{- commutateur : token présent plusieurs fois dans une liste
   elemIndices requiert l'interface Eq -}

allCnt :: (Eq a) => [a] -> [(a, Int)]
allCnt xs   =
    let  cntElem zs z = (z, length (elemIndices z zs))
    in   nub $ map (cntElem xs) xs

    
    
    
{--------------------------------------------------------------------------------------------------------

-}

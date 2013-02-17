-- Pert.hs
-- Chemin critique, planification

-- un Pert est défini comme l'ensemble récursif des requisits d'une liste de tâches, de leurs durées
-- on utilise une liste pour représenter l'ensemble des requisit mais l'ordre est non significatif
-- usage des ids : pour affichage seulement (?)

module Pert where 


data Task = Task { tid :: Int
                 , dur :: Int
                 , req :: [Task]
                 }
            deriving (Show)

data Pert =  Pert [Task]


t1 = Task 1 5 []
t2 = Task 2 3 []
t3 = Task 3 5 [t1, t2]
t4 = Task 4 2 [t2, t3]
t5 = Task 5 8 [t2]
t6 = Task 6 1 [t4, t5]
tList = [t1,t2,t3,t4,t5,t6]

pert_1 = Pert [t6]

maxx :: [Int] -> Int
maxx [] = 0
maxx x  = maximum x

-- Date de début d'une tâche = fin de son requisit le plus tardif (0 lag)
calStart :: Task -> Int
calStart t = maxx (map calEnd (req t))

-- Date de fin d'une tâche = date de début + durée
calEnd :: Task -> Int
calEnd t  =  (calStart t) + (dur t)


-- no-slack-Filter : liste des requisit critiques
nsFilter :: Task -> [Task] -> [Task]
nsFilter t = filter (\x -> calEnd x == calStart t)

-- no-slack : graphe des tâches critiques uniquement
noSlack :: Task -> Task
noSlack t = Task (tid t) (dur t) (map noSlack (nsFilter t (req t)))


-- liste des id de tâches dans le graphe antécédent
taskIdList :: Task -> [Int]
taskIdList t = [tid t] ++ concat (map taskIdList (req t))

-- liste des relations de précession dans le graphe antécédent
linkIdList :: Task -> [(Int, Int)]
linkIdList t = map (\x -> (tid t, tid x)) (req t) ++ concat(map linkIdList (req t))







{------------------------------------------------------------------------------

    Essais sur les chunks 
    1. Hypothèses : 
       - on sait détecter les chunks
       - les chunks sont les constituants des signifiants
       - les propriétés et fonctions des chunks sont à calculer
       - le calcul se fait sur le contenu des chunks et leur position
       Le modèle suppose de concevoir quelles fonctions/propriétés peuvent porter les chunks,
       donc le point-clef est la modélisation de la formation du signifiant,
       ce qui est parfaitement naturel et n'est pas un point faible de la théorie.
       Il ne sert donc à pas grand-chose d'essayer de "faire quelque chose" des chunks détectés,
       il faut d'abord pouvoir spécifié le résultat attendu.
       
       
       
       2. Observations
       - sur la détection des chunks
         les mots-outils déterminants (le la les un une des ce ces cette cettes
     
    Module      :  Chunks
    Copyright   :  Tann 2012/08/08
    License     :  AllRightsReserved

    Maintainer  :  Tann
    Stability   :  Draft
    Portability :

-----------------------------------------------------------------------------}
t1 = ["La hausse contenue", "des effectifs hospitaliers", "et territoriaux", "constatée", "ce mardi", "par l'Acoss", "permet d'envisager", "un premier recul", "du nombre total", "de fonctionnaires",".", "Les effectifs", "de la fonction publique", "ont reculé", "pour la première fois", "en 2011", ".", "Selon les statistiques", "de l'Acoss", "publiées", "ce mardi",",", "les personnels employés", "dans la fonction publique hospitalière", "et", "dans la fonction publique territoriale", "ont crû", "l'année dernière", "dans de faibles proportions",",", "qui", "ne compensent pas","," "contrairement aux autres années",",", "les économies réalisées", "dans la fonction publique d'Etat",".", "Selon l'Acoss",",", "les personnels", "de la fonction publique hospitalière", "ont progressé", "de 0,5%", "en 2011",",", "soit", "7000 personnes",",", "après", "une hausse", "de 0,9%", "en 2010",".", "Le ralentissement", "est", "encore plus notable", "dans la fonction publique territoriale",".", "Cette branche", "de la fonction publique",",","qui emploie", "près de 2 millions de personnes", "en 2011", "enregistrait", "jusqu'à présent", "une progression", "très dynamique",".","En 2011",",","sous l'effet", "de la rigueur budgétaire", "-", "les fonds", "attribués par l'Etat", "aux collectivités locales", "ont été", "pour la première fois", "gelés en valeur", "-",",", "ses effectifs", "n'ont progressé", "que de 0,3%", "soit 5900 personnes", "contre 1,9%", "en 2010",".", "La fonction publique d'Etat", "a", "depuis plusieurs années déjà",  "amorcé", "un mouvement", "de réduction", "de ses effectifs",".", "Le non-remplacement", "d'un fonctionnaire", "sur deux", "partant à", "la retraite", "a ainsi permis", "la suppression", "d'un peu plus", "de 30.000 postes", "en 2011", ",", "et", "près de 120.000", "depuis 2008",".", "D'après", "le dernier rapport annuel", "de la fonction publique",",", "les effectifs globaux", "de la fonction publique", "s'étaient déjà", "quasiment stabilisés", "en 2009",".", "Ils n'avaient alors", "progressé", "que de 0,4%", "contre 0,8%", "en moyenne", "entre 1998", "et 2009",".", "Surtout",",", "en excluant", "les 15.000 agents", "des Assedic", "-", "de statut initialement privé", "-", "passés en 2009", "dans le giron", "de Pôle emploi",",", "la progression", "se limitait", "à 0,1%",",", "soit", "5600 agents,",".", "Cette année",",","la fonction publique", "ne gagnant", "«que» 12.900 postes",",", "l'évolution nette", "devrait être", "négative",".", "Le recul", "des effectifs", "de la fonction publique", "pourrait même être", "un peu plus marqué", "en 2011", "que l'Acoss", "ne le laisse entendre",".", "La caisse nationale", "des Urssaf", "est en effet", "régulièrement accusée", "par la Fédération hospitalière de France", "(FHF)", "de surévaluer", "les effectifs", "de la fonction publique hospitalière",".", "«Le calcul", "de l'Acoss", "se fait", "sur les personnes physiques cotisantes",",", "mais", "ne tient pas compte", "de la baisse", "du nombre d'heures supplémentaires", "et", "du moindre recours", "aux remplacements»",",", "fait-on valoir", "à la FHF",".", "La fédération",",", "qui ne publiera pas", "ses propres chiffres", "cette année",",","estime", "que", "l'évolution des effectifs", "est en réalité", "inférieure à 0,4%","."]


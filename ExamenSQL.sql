--Question 4
-- Inscription du mot de passe d'un enseignant ou d'un etudiant

Alter table etudiant add password varchar(50);
Update etudiant set password = ora_hash(matricule) where matricule = valeur;

Alter table enseignants add password varchar(50);
Update enseignants set password = ora_hash(matricule) where matricule = valeur;

--Question 5
-- Affichage du jour, la tranche horaira, la specialité, le cour,
-- le nombre de credits du cours et la période academique
SELECT DISTINCT T.jourCoursDate as jours ,
                C.intituleCourt ||'('||C.codeCours||')' as cours ,
                C.credits as credits_cours,
                'trimestre'|| C.periodeAcademiqueIdTrim  as periode_trimestrielle,
                ce.specialiteNomSpec || cd.classNiveauidNiveau as specialite,
                T.tranche ||'heures' as tranche_horaire
FROM Cours C
JOIN Typehoraire T
ON C.codeCours= T.crsCodeCours
JOIN Jourcours j
ON J.dateJourCours=T.jourCoursDate
JOIN Coursdeclasse cd
ON  T.crsCodeCours=cd.crsCodeCours
JOIN Classe ce
ON ce.specialiteNomSpec=cd.classSpecialiteNomspec
INNER JOIN ClassePeriodeacademique ca
ON C.periodeAcademiqueIdTrim=ca.PERIODEACADEMIQUEIDTRIM
WHERE ce.specialiteNomSpec='TIPAM'
AND   cd.classNiveauidNiveau=002
ORDER BY T.jourCoursDate ASC;
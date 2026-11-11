import 'quiz_fr.dart';

const Map<String, FrQuestion> quizFrExtra = {
  'sign-no-right': FrQuestion(
    prompt: 'Que signifie ce panneau?',
    choices: [
      'Tenez la droite',
      'Interdiction de tourner à droite',
      'Fin de la voie de droite',
      'Hôpital à droite',
    ],
    explanation:
        'Un anneau rouge autour d’une flèche à droite barrée interdit ce virage. Ne tournez que si un panneau ou un feu le permet.',
    topic: 'Panneaux',
  ),
  'sign-no-parking': FrQuestion(
    prompt: 'Que signifie ce panneau?',
    choices: [
      'Stationnement de 5 minutes',
      'Stationnement interdit',
      'Stationnement d’hôpital seulement',
      'Dépassement interdit',
    ],
    explanation:
        'Un disque bleu, anneau rouge, P et barre est l’aide d’étude « stationnement interdit ». Un arrêt bref peut rester permis selon la plaque réelle — confirmez les flèches.',
    topic: 'Panneaux',
  ),
  'sign-no-stopping': FrQuestion(
    prompt: 'Que signifie ce panneau?',
    choices: [
      'Arrêt interdit',
      'Passage à niveau',
      'Entrée interdite',
      'Cédez',
    ],
    explanation:
        'Un disque bleu, anneau rouge et X rouge est l’aide d’étude « arrêt interdit ». Ne vous arrêtez pas dans la zone, sauf exception du guide officiel.',
    topic: 'Panneaux',
  ),
  'sign-keep-right': FrQuestion(
    prompt: 'Que vous dit ce panneau?',
    choices: [
      'Passez à droite de l’obstacle ou du terre-plein',
      'Interdiction de tourner à droite',
      'Sens unique vers la gauche',
      'Stationnement à droite seulement',
    ],
    explanation:
        'Les losanges jaunes préviennent. Ce dessin montre de passer à droite d’un îlot ou d’un obstacle. Ne coupez pas à gauche.',
    topic: 'Panneaux',
  ),
  'sign-two-way': FrQuestion(
    prompt: 'Contre quoi ce panneau prévient-il?',
    choices: [
      'Début d’une rue à sens unique',
      'Circulation à double sens plus loin',
      'Dépassement interdit dans les deux sens',
      'Fin d’autoroute',
    ],
    explanation:
        'Deux flèches opposées sur un losange : circulation à double sens — souvent après un tronçon à sens unique. Tenez la droite et surveillez les véhicules d’en face.',
    topic: 'Panneaux',
  ),
  'sign-merge': FrQuestion(
    prompt: 'Que signifie ce panneau?',
    choices: [
      'Chaussée plus étroite des deux côtés',
      'Une autre voie ou bretelle se fusionne',
      'Entrée interdite',
      'Arrêt plus loin',
    ],
    explanation:
        'Un panneau de concourance : deux flux se rejoignent. Ajustez la vitesse et laissez un intervalle.',
    topic: 'Panneaux',
  ),
  'sign-winding': FrQuestion(
    prompt: 'Que signifie ce panneau?',
    choices: [
      'Route sinueuse — ajustez la vitesse',
      'Carrefour giratoire',
      'Chaussée glissante seulement',
      'Demi-tour interdit',
    ],
    explanation:
        'Une route sinueuse annonce une série de courbes. Ralentissez assez pour rester dans votre voie.',
    topic: 'Panneaux',
  ),
  'sign-hospital': FrQuestion(
    prompt: 'Que indique ce panneau?',
    choices: [
      'Zone scolaire',
      'Hôpital',
      'Téléphone d’urgence',
      'Arrêt interdit',
    ],
    explanation:
        'Un carré bleu avec H est l’aide d’étude hôpital / services médicaux. Il oriente; ce n’est pas un arrêt ni une limite de vitesse.',
    topic: 'Panneaux',
  ),
  'sign-wildlife': FrQuestion(
    prompt: 'Contre quoi ce panneau prévient-il?',
    choices: [
      'Encans de bétail plus loin',
      'La faune peut traverser — soyez prêt à ralentir',
      'Stationnement de zoo',
      'Dépassement interdit à cause des animaux',
    ],
    explanation:
        'Une silhouette d’animal sur losange jaune : la faune peut traverser. Ralentissez si vous voyez un mouvement; ne déviez pas vers la circulation d’en face.',
    topic: 'Panneaux',
  ),
  'sign-stop-ahead': FrQuestion(
    prompt: 'Que signifie ce panneau?',
    choices: [
      'Arrêtez maintenant dans la voie',
      'Panneau d’arrêt plus loin — préparez-vous',
      'Arrêt seulement pour les autobus scolaires',
      'Cédez plus loin',
    ],
    explanation:
        'Un losange avec un symbole d’arrêt annonce un arrêt souvent masqué par une courbe. L’arrêt légal est au panneau d’arrêt, pas à cet avertissement.',
    topic: 'Panneaux',
  ),
  'sign-signal-ahead': FrQuestion(
    prompt: 'Que signifie ce panneau?',
    choices: [
      'Feux de circulation plus loin',
      'Le prochain feu est toujours jaune clignotant',
      'Passage à niveau avec feux seulement',
      'Entrée interdite',
    ],
    explanation:
        'Un losange avec un feu annonce des feux plus loin. Soyez prêt à arrêter au jaune ou au rouge.',
    topic: 'Panneaux',
  ),
  'sign-maximum-80': FrQuestion(
    prompt: 'Que signifie ce panneau?',
    choices: [
      'Vitesse conseillée 80 sous la pluie seulement',
      'La vitesse maximale affichée est 80 km/h',
      'Vitesse minimale 80 km/h',
      'Vitesse de sortie 80 km/h',
    ],
    explanation:
        'MAXIMUM avec un chiffre est une limite réglementaire en km/h. Aller plus vite est une infraction; les conditions peuvent encore exiger plus lent.',
    topic: 'Panneaux',
  ),
  'sign-no-passing': FrQuestion(
    prompt: 'Contre quoi ce panneau prévient-il?',
    choices: [
      'Double sens sans dépassement sur ce tronçon',
      'Rue à sens unique',
      'Gardez la gauche pour dépasser',
      'Stationnement des deux côtés',
    ],
    explanation:
        'Un avertissement de dépassement interdit va avec le marquage. Ne dépassez pas si la ligne jaune continue est de votre côté ou si un panneau l’interdit.',
    topic: 'Panneaux',
  ),
  'sign-playground': FrQuestion(
    prompt: 'Que marque ce panneau?',
    choices: [
      'Aire de jeu ou parc — surveillez les enfants',
      'Route de camions',
      'Baie d’urgence d’hôpital',
      'Passage à niveau',
    ],
    explanation:
        'Un pentagone fluorescent peut marquer une aire de jeu, comme une zone scolaire. Surveillez les enfants; une limite peut être affichée à part.',
    topic: 'Panneaux',
  ),
  'pts-not-national': FrQuestion(
    prompt: 'Les régimes de points au Canada :',
    choices: [
      'Utilisent un tableau fédéral unique de 15 points puis 30 jours de suspension',
      'Sont fixés par chaque province ou territoire (parfois un assureur), avec des noms et seuils différents',
      'Ne concernent que les permis commerciaux',
      'Sont inédits partout',
    ],
    explanation:
        'Points d’inaptitude ontariens, québécois, Driver Penalty Points en C.-B., cote de sécurité au Manitoba : ce n’est pas le même tableau. Étudiez l’endroit où vous serez titulaire.',
    topic: 'Points',
    sourceNote:
        'Comparaison non officielle des pages officielles liées dans le sujet Points.',
  ),
  'pts-gdl-lower': FrQuestion(
    prompt: 'Avec un permis d’apprenti ou novice, les seuils de points :',
    choices: [
      'Sont plus élevés parce que vous apprenez encore',
      'Sont souvent plus bas — une mesure peut arriver avec moins de points qu’un permis complet',
      'Ne s’appliquent jamais avant un permis complet',
      'Sont le même chiffre dans chaque province',
    ],
    explanation:
        'Exemples officiels : G1/G2 en Ontario dès 2–9 points contre 6–15 en permis complet; GDL albertain dès 4; apprenti néo-écossais à 4. Lisez la page du lieu.',
    topic: 'Points',
    sourceNote:
        'Question d’étude comparant les seuils GDL et permis complet publiés.',
  ),
  'pts-on-zero': FrQuestion(
    prompt: 'En Ontario, sans condamnation, un conducteur part avec :',
    choices: [
      '15 points d’inaptitude qu’on retranche ensuite',
      'Zéro point, puis des points après les condamnations',
      '7 points « en réserve »',
      'Une cote de sécurité de +15',
    ],
    explanation:
        'Page ontarienne : vous partez de zéro et accumulez. Les points restent deux ans à compter de la date de l’infraction.',
    topic: 'Points',
    sourceNote:
        'Ontario — Understanding demerit points : https://www.ontario.ca/page/understanding-demerit-points',
  ),
  'pts-on-15': FrQuestion(
    prompt: 'En Ontario, un permis complet à 15 points d’inaptitude :',
    choices: [
      'Peut être suspendu 30 jours (selon la page officielle actuelle)',
      'Reçoit seulement une lettre',
      'Mène toujours à la prison',
      'A la même suspension novice de 60 jours',
    ],
    explanation:
        'Ontario : permis complet, avis à 6–8 puis 9–14; 15 ou plus = 30 jours. Après la suspension, 7 points restent. G1/G2 à 9 ou plus = 60 jours, pas 30.',
    topic: 'Points',
    sourceNote:
        'Ontario — Understanding demerit points : https://www.ontario.ca/page/understanding-demerit-points',
  ),
  'pts-on-novice': FrQuestion(
    prompt: 'Les G1 ou G2 ontariens atteignent une suspension de 60 jours à :',
    choices: [
      '2 points',
      '9 points ou plus',
      '15 points, comme un G complet',
      'Il n’y a pas de règle novice en Ontario',
    ],
    explanation:
        'Novice ontarien : avis à 2–5, second avis à 6–8, 60 jours à 9 ou plus. Après, 4 points restent sur la page.',
    topic: 'Points',
    sourceNote:
        'Ontario — Understanding demerit points : https://www.ontario.ca/page/understanding-demerit-points',
  ),
  'pts-on-handheld': FrQuestion(
    prompt: 'La page ontarienne des points indique, pour un appareil portatif :',
    choices: [
      '0 point (amende seulement)',
      '3 points d’inaptitude',
      '15 points d’inaptitude',
      'Une prime de points de pénalité seulement',
    ],
    explanation:
        'La page liste 3 points pour un appareil portatif, et 6 pour des exemples comme un autobus scolaire, la conduite imprudente ou une course. Confirmez le tableau actuel.',
    topic: 'Points',
    sourceNote:
        'Ontario — Understanding demerit points : https://www.ontario.ca/page/understanding-demerit-points',
  ),
  'pts-qc-learner': FrQuestion(
    prompt: 'La limite SAAQ de points d’inaptitude pour un permis d’apprenti ou probatoire est :',
    choices: [
      '4 points',
      '15 points, comme à 25 ans ou plus',
      '8 points à tout âge',
      'Non publiée',
    ],
    explanation:
        'Tableau SAAQ : 4 points apprenti/probatoire; 8 avant 23 ans; 12 à 23–24 ans; 15 à 25 ans ou plus. Les points tombent généralement deux ans après la déclaration de culpabilité.',
    topic: 'Points',
    sourceNote:
        'PDF SAAQ : https://saaq.gouv.qc.ca/fileadmin/documents/publications/demerit-points-driver-licence.pdf',
  ),
  'pts-qc-25': FrQuestion(
    prompt: 'Au Québec, permis régulier à 25 ans ou plus, la limite SAAQ est :',
    choices: [
      '4',
      '8',
      '12',
      '15',
    ],
    explanation:
        'SAAQ : 15 points à 25 ans ou plus. Limites plus jeunes : 8 (moins de 23 ans) et 12 (23 ou 24 ans).',
    topic: 'Points',
    sourceNote:
        'PDF SAAQ : https://saaq.gouv.qc.ca/fileadmin/documents/publications/demerit-points-driver-licence.pdf',
  ),
  'pts-bc-dpp': FrQuestion(
    prompt: 'Les Driver Penalty Points de l’ICBC sont surtout :',
    choices: [
      'Un tableau ontarien de suspension à 15 points',
      'Une prime d’assurance dès 4 points ou plus sur 12 mois',
      'Un score du Code criminel fédéral',
      'Inutilisés en Colombie-Britannique',
    ],
    explanation:
        'La prime DPP de l’ICBC est une surprime à 4 points ou plus en 12 mois. Ce n’est pas la suspension ontarienne de 30 jours. L’ICBC publie aussi des exemples de contraventions avec points et amende.',
    topic: 'Points',
    sourceNote:
        'Pages ICBC sur la prime de points de pénalité et la conduite avec distraction.',
  ),
  'pts-ab-15': FrQuestion(
    prompt: 'En Alberta, un permis complet à 15 points ou plus (première fois) :',
    choices: [
      'Une lettre seulement',
      'Une suspension d’un mois, puis 7 points restants',
      'Une suspension novice de 60 jours',
      'Des accusations automatiques au Code criminel',
    ],
    explanation:
        'Alberta : avis à 8–14; 15 ou plus = 1 mois la première fois, 3 mois si ça se reproduit dans l’année, 6 mois la troisième fois en deux ans. Reprise avec 7 points. Les points restent deux ans après la déclaration de culpabilité.',
    topic: 'Points',
    sourceNote:
        'Alberta — Demerit driving suspension : https://www.alberta.ca/demerit-driving-suspension',
  ),
  'pts-ab-gdl': FrQuestion(
    prompt: 'Le GDL albertain (classes 7, 5-GDL, 6-GDL) est suspendu à :',
    choices: [
      '15 points, comme un permis complet',
      '8 points ou plus (1 mois; reprise avec 3 points)',
      '2 points',
      'Il n’y a pas de règle GDL en Alberta',
    ],
    explanation:
        'GDL albertain : lettre à 4–7 points; 8 ou plus = 1 mois, puis 3 points restants.',
    topic: 'Points',
    sourceNote:
        'Alberta — Demerit driving suspension : https://www.alberta.ca/demerit-driving-suspension',
  ),
  'pts-sk-letter': FrQuestion(
    prompt: 'Le programme d’amélioration de la SGI envoie une lettre d’information à :',
    choices: [
      '3 points',
      '9 points ou plus',
      '21 points (cette étape est une suspension de 30 jours)',
      '15 points seulement en Ontario',
    ],
    explanation:
        'Tableau SGI : lettre à 9+, avertissement à 12+, cours à 15+, formation à 18+, puis 30/90/180 jours à 21/24/27, entrevue à 30, examen à 33.',
    topic: 'Points',
    sourceNote:
        'SGI Driver Improvement Program : https://sgi.sk.ca/handbook/-/knowledge_base/drivers/driver-improvement-program',
  ),
  'pts-mb-dsr': FrQuestion(
    prompt: 'La Société d’assurance publique du Manitoba utilise :',
    choices: [
      'Le tableau ontarien de 15 points inchangé',
      'Une cote de sécurité (MPI décrit 41 niveaux de +20 à −20)',
      'Seulement les Driver Penalty Points de l’ICBC',
      'Aucune cote publiée',
    ],
    explanation:
        'La cote de sécurité MPI est une échelle de primes, pas un barème classique de suspension. Ne convertissez pas les niveaux en points ontariens.',
    topic: 'Points',
    sourceNote:
        'MPI Driver Safety Rating : https://www.mpi.mb.ca/driver-safety-rating/',
  ),
  'pts-ns-learner': FrQuestion(
    prompt: 'En Nouvelle-Écosse, un permis d’apprenti est suspendu à :',
    choices: [
      '4 points',
      '10 points (seuil « tous les autres » sur cette page)',
      '15 points',
      'Il n’y a pas de seuil d’apprenti',
    ],
    explanation:
        'Nouvelle-Écosse : les points restent deux ans après la déclaration de culpabilité. Apprenti : suspension à 4. Nouveau titulaire : entrevue à 4, 6 mois à 6. Autres : entrevue à 6, 6 mois à 10.',
    topic: 'Points',
    sourceNote:
        'Régime de points de la Nouvelle-Écosse : https://novascotia.ca/sns/rmv/licence/point.asp',
  ),
  'pts-nl-12': FrQuestion(
    prompt: 'À Terre-Neuve-et-Labrador, un conducteur de classe 5 (non novice) est suspendu à :',
    choices: [
      '3 points',
      '12 points en deux ans',
      '15 points comme en Ontario',
      '6 points sans avis préalable',
    ],
    explanation:
        'T.-N.-L. : avis à 6, un autre à 9, suspension à 12 points en deux ans pour les classes 1 à 6. Novices : avis à 3, suspension à 6 en un an. Première suspension : deux mois sur cette page.',
    topic: 'Points',
    sourceNote:
        'Régime de T.-N.-L. : https://www.gov.nl.ca/motorregistration/existing-drivers/driver-records-and-suspended-drivers/demerit-point-system/',
  ),
  'pts-yt-gdl': FrQuestion(
    prompt: 'Au Yukon, un conducteur GDL est suspendu pour points à :',
    choices: [
      '7 points ou plus',
      '15 points ou plus (seuil hors GDL sur la même page)',
      '4 points seulement',
      'Le Yukon ne publie pas de seuil GDL',
    ],
    explanation:
        'Yukon : GDL à 7 ou plus; autres permis à 15 ou plus. Durée : 1 mois la première fois; 3 mois si une deuxième en un an; 6 mois pour trois suspensions ou plus en deux ans.',
    topic: 'Points',
    sourceNote:
        'Yukon — suspension du permis : https://yukon.ca/en/driving-and-transportation/driving-offences-and-penalties/find-out-how-your-licence-could-become-suspended',
  ),
  'pts-nt-24': FrQuestion(
    prompt: 'Aux Territoires du Nord-Ouest, les points restent au dossier :',
    choices: [
      '6 mois',
      '24 mois',
      'Pour toujours',
      'Jusqu’à ce que vous quittiez le territoire',
    ],
    explanation:
        'IDMV : 24 mois. Classes 7 et 5P : suspension à 6 points (30 jours). Avis à 8; entrevue à 12 ou plus; 15 points = 30 jours.',
    topic: 'Points',
    sourceNote:
        'T.N.-O. — points et suspensions : https://www.idmv.inf.gov.nt.ca/Drivers/DriverHistory/Demerit-points-and-suspensions',
  ),
  'pts-nb-warn': FrQuestion(
    prompt: 'La Loi sur les véhicules à moteur du N.-B. (art. 297) exige un avis écrit à :',
    choices: [
      '7 points ou plus mais moins de 10 (et un avis dès 3 points)',
      '15 points et une suspension ontarienne de 30 jours recopiée ici',
      'Zéro point',
      'Une cote de sécurité de −20',
    ],
    explanation:
        'Art. 297 : avis à 3 points ou plus, et entre 7 et moins de 10. Cette question n’invente pas une durée de suspension à 10 points — lisez la Loi.',
    topic: 'Points',
    sourceNote:
        'Loi sur les véhicules à moteur du N.-B. : https://laws.gnb.ca/en/document/cs/M-17',
  ),
  'pts-pe-12': FrQuestion(
    prompt: 'À l’Île-du-Prince-Édouard, un conducteur expérimenté (permis depuis plus de deux ans) est suspendu trois mois à :',
    choices: [
      '4 points',
      '12 points en deux ans',
      '15 points comme en Ontario',
      'L’Î.-P.-É. ne publie pas de page sur les points',
    ],
    explanation:
        'Page de l’Î.-P.-É. : conducteurs expérimentés — avis 6–8, entrevue 9–11, trois mois à 12 ou plus en deux ans. GDL étape 1 : toute infraction avec points; étape 2 à 6 points (un mois); étape 3 à 9 (un mois).',
    topic: 'Points',
    sourceNote:
        'Régime de l’Î.-P.-É. : https://www.princeedwardisland.ca/en/information/transportation-and-infrastructure/demerit-point-system-for-drivers',
  ),
  'pts-nu-regs': FrQuestion(
    prompt: 'Les seuils de points du Nunavut dans cette appli :',
    choices: [
      'Sont recopiés des T.N.-O. pour que vous n’ayez pas à lire la loi nunavute',
      'Doivent se lire dans le Règlement sur les points d’inaptitude — cette appli ne les invente pas',
      'N’existent pas, car le Nunavut n’a pas de texte',
      'Sont toujours 15 points / 30 jours partout au Canada',
    ],
    explanation:
        'Le Nunavut publie un règlement. Ouvrez la consolidation. Recopier les chiffres des T.N.-O. serait inventer.',
    topic: 'Points',
    sourceNote:
        'Règlement du Nunavut : https://www.nunavutlegislation.ca/en/consolidated-law/drivers-licence-demerit-point-regulations-consolidation',
  ),
};

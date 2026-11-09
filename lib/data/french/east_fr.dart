import 'models.dart';

const nsFr = FrJurisdiction(
  name: 'Nouvelle-Écosse',
  authority: 'Registraire des véhicules automobiles / Service Nouvelle-Écosse',
  passengerLicence: 'Classe 5 (apprenti classe 7, 5N nouvellement titulaire, puis 5R / condition 47)',
  parentalConsent: 'Permission écrite d’un parent ou tuteur si vous avez moins de 18 ans. Ils peuvent retirer le consentement par écrit au registraire, ce qui peut annuler le permis avant 18 ans.',
  stages: [
    FrStage(
      name: 'Apprenti',
      duration: 'Au moins 12 mois avant un examen pratique, ou 9 mois après un cours approuvé (25 h de classe et 10 h en véhicule). Un permis d’apprenti délivré après le 1er avril 2015 est valide deux ans.',
      howToEnter: 'Avoir 16 ans ou plus, réussir vision et examen de connaissances en deux parties, présenter des pièces et acheter le permis. La carte porte un grand L.',
      restrictions: [
        'Alcoolémie zéro.',
        'Accompagnateur à l’avant titulaire d’un permis régulier (hors GDL).',
        'Pas d’autres passagers, sauf exceptions limitées d’école de conduite.',
        'Pas de couvre-feu extra pour les apprentis auto de classe 7 (l’accompagnateur est toujours là). Les apprentis moto ont des règles de jour seulement.',
        'Quatre points ou plus : suspension de six mois, puis le délai recommence.',
      ],
      howToAdvance: 'Réussir l’examen pratique après le délai d’attente.',
    ),
    FrStage(
      name: 'Nouvellement titulaire',
      duration: 'Minimum deux ans. Il faut aussi un cours de conduite défensive de 6 h ou une formation reconnue (25 h théorie, 10 h conduite). Sans certificat, vous restez à cette étape indéfiniment.',
      howToEnter: 'Réussir l’examen pratique de classe 5.',
      restrictions: [
        'Alcoolémie zéro.',
        'Un seul passager à l’avant; arrière limité aux ceintures.',
        'Pas de passage au-delà de la classe 5.',
        'Pas de conduite minuit–5 h sauf exemption de travail ou accompagnateur.',
      ],
      howToAdvance: 'Servir au moins deux ans, déposer le certificat de cours, puis passer à l’étape de personne restreinte.',
    ),
    FrStage(
      name: 'Personne restreinte (condition 47)',
      duration: 'Deux années pleines.',
      howToEnter:
          'Quitter l’étape nouvellement titulaire avec le cours au dossier.',
      restrictions: [
        'Alcoolémie zéro (et pas de drogue dans l’organisme au volant).',
        'Ne peut pas superviser un apprenti ni un nouvellement titulaire pendant le couvre-feu.',
      ],
      howToAdvance: 'Après deux ans comme personne restreinte, les restrictions GDL sont levées.',
    ),
  ],
  knowledgeTest: FrKnowledge(
    summary: 'Deux parties : panneaux et règles. Les deux doivent être réussies. Une partie échouée = tout reprendre. Examens oraux sur rendez-vous.',
    passRule: '16/20 à chaque partie',
    format: '20 questions à choix multiples par partie.',
  ),
  roadTest: 'Réservez seulement avec un reçu d’examen pratique valide. Le permis d’apprenti doit être valide le jour de l’examen.',
  medical: 'La vision doit rencontrer les normes du registraire. Un certificat médical ou optique est parfois exigé.',
  identityDocuments: [
    'Preuve d’âge (liste du registraire).',
    'Deux autres pièces avec votre signature.',
  ],
  fees: [
    FrFee(
      label: 'Reçu d’examen de connaissances',
      note: '15,03 \$ taxes incluses. Répertoire des permis de la Nouvelle-Écosse.',
    ),
    FrFee(
      label: 'Permis d’apprenti',
      note: '25,10 \$, sans taxe. Document temporaire de 30 jours, puis la carte par la poste.',
    ),
    FrFee(
      label: 'Reçu d’examen pratique',
      note: '52,54 \$ taxes incluses. À payer avant de réserver.',
    ),
    FrFee(label: 'Guide du conducteur', note: '9,75 \$ taxes incluses.'),
  ],
  otherClasses: [
    'La moto utilise la classe LM / 5A avec ses propres délais GDL.',
    'Classe 8 tracteur agricole, distincte.',
  ],
  sources: [
    FrLink(label: 'Système de permis progressif', englishOnly: true),
    FrLink(label: 'Permis d’apprenti', englishOnly: true),
    FrLink(label: 'Qui passe l’examen', englishOnly: true),
  ],
  dataNotes: 'Certains vieux PDF GDL mentionnent une attente plus courte; les pages actuelles du registraire indiquent 12 mois (9 avec formation). L’appli suit ces pages.',
);

const nbFr = FrJurisdiction(
  name: 'Nouveau-Brunswick',
  authority: 'Service Nouveau-Brunswick / Registraire des véhicules',
  passengerLicence: 'Classe 5 (via classe 7 niveau 1 puis niveau 2)',
  parentalConsent: 'Les demandeurs de moins de 18 ans ont besoin d’un consentement parental témoigné par une personne non parente.',
  stages: [
    FrStage(
      name: 'Niveau 1',
      duration: 'Minimum 12 mois, ou 8 mois après une école de conduite reconnue (certificat vert).',
      howToEnter: 'Réussir la vision (20/40 meilleur œil) plus les examens écrit, de base et de panneaux. Les nouveaux conducteurs reçoivent une classe 7 niveau 1 marquée L.',
      restrictions: [
        'Tolérance zéro alcool ou drogue.',
        'Seulement l’accompagnateur (classe 5 ou mieux, au moins 3 ans d’expérience) dans le véhicule, à l’avant.',
        'Pas de conduite entre minuit et 5 h.',
      ],
      howToAdvance: 'Réussir l’examen pratique de véhicule de tourisme.',
    ),
    FrStage(
      name: 'Niveau 2',
      duration: 'Au moins 12 mois. Le GDL dure au minimum 24 mois au total; si vous entrez plus tôt grâce à la formation, le reste se passe ici.',
      howToEnter: 'Réussir l’examen pratique du niveau 1.',
      restrictions: [
        'Tolérance zéro alcool ou drogue.',
        'Pas plus de trois passagers, un seul à l’avant.',
        'Moins de 21 ans : pas de conduite minuit–5 h sauf accompagnateur classe 5+ avec 3 ans, ou trajet travail/école, urgence, ou permission du registraire.',
      ],
      howToAdvance: 'Après 24 mois au programme dont 12 au niveau 2, demandez une classe 5. Pas d’examen extra, mais le passage n’est pas automatique.',
    ),
    FrStage(
      name: 'Classe 5',
      duration: 'Permis standard après la demande à la fin du GDL.',
      howToEnter: 'Terminer les niveaux 1 et 2 et présenter une demande.',
      restrictions: ['Les règles adultes du Nouveau-Brunswick s’appliquent.'],
      howToAdvance:
          'Classes commerciales dès 18 ans avec examen médical et tests.',
    ),
  ],
  knowledgeTest: FrKnowledge(
    summary: 'Examens écrit, de base et de panneaux pour la classe 7 niveau 1. Résultats valides 6 mois.',
  ),
  roadTest: 'Examen de véhicule de tourisme pour le niveau 2. Il faut avoir détenu le niveau 1 un an, ou 8 mois avec certificat, sauf si vous étiez déjà pleinement titulaire ailleurs.',
  medical: 'Dépistage visuel pour un premier permis. Rapports d’aptitude médicale pour les classes commerciales.',
  identityDocuments: [
    'Si vous n’êtes pas déjà titulaire : une preuve d’identité et deux preuves de résidence.',
    'Formulaire de consentement si moins de 18 ans.',
  ],
  fees: [
    FrFee(
      label: 'Examens et cartes',
      note: 'Les montants publics de Service Nouveau-Brunswick n’ont pas été confirmés. Demandez à SNB.',
    ),
  ],
  otherClasses: [
    'Classe 8 tracteur et classe 9 cyclomoteur dès 14 ans.',
    'Classes 1 à 4 dès 18 ans.',
  ],
  sources: [
    FrLink(label: 'Permis progressifs', englishOnly: true),
    FrLink(label: 'Exigences d’examen (PDF)', englishOnly: true),
  ],
  dataNotes:
      'Les règles GDL viennent de gnb.ca. Les tarifs ne sont pas publiés ici.',
);

const peFr = FrJurisdiction(
  name: 'Île-du-Prince-Édouard',
  authority: 'Access PEI / Sécurité routière',
  passengerLicence:
      'Classe 5 (via permis d’instruction classe 7, puis étapes GDL 2 et 3)',
  parentalConsent: 'Confirmez le processus actuel de consentement des moins de 18 ans à Access PEI.',
  stages: [
    FrStage(
      name: 'Étape 1 (L)',
      duration: '365 jours avant l’examen pratique, ou 275 jours si vous êtes inscrit à une formation certifiée. Le permis est valide deux ans.',
      howToEnter: 'Demandez à 16 ans ou plus un permis d’instruction. Vous recevez un autocollant L jaune pour le pare-brise.',
      restrictions: [
        'Le superviseur détient un permis valide depuis au moins quatre ans et s’assoit à l’avant.',
        'Seuls le superviseur et sa famille immédiate peuvent être dans le véhicule.',
        'Alcoolémie du superviseur sous 0,05; apprenti à zéro.',
        'Pas plus de personnes que de ceintures.',
        'Pas de téléphone à main; mains libres permis.',
        'Moins de 21 ans : pas de conduite 1 h–5 h.',
      ],
      howToAdvance: 'Réussir l’examen pratique de classe 5 après le délai.',
    ),
    FrStage(
      name: 'Étape 2 (G)',
      duration: '365 jours. Une première infraction GDL ajoute 30 jours de suspension; une seconde, 90 jours, et le programme s’allonge.',
      howToEnter: 'Réussir l’examen pratique. Afficher l’autocollant G.',
      restrictions: [
        'Un seul passager hors famille; les autres doivent être de la famille immédiate.',
        'Alcoolémie zéro.',
        'Pas de téléphone à main; mains libres permis.',
        'Moins de 21 ans : pas de conduite 1 h–5 h sauf accompagnateur titulaire depuis au moins quatre ans avec alcoolémie sous 0,05. Exemptions de travail sur demande.',
      ],
      howToAdvance: 'Compléter 365 jours sans faire recommencer le délai.',
    ),
    FrStage(
      name: 'Étape 3 (G)',
      duration: 'Encore 365 jours. Durée minimale du programme : trois ans, ou deux ans plus 275 jours avec formation certifiée.',
      howToEnter: 'Terminer l’étape 2.',
      restrictions: [
        'Passagers limités aux ceintures.',
        'Pas de téléphone à main; mains libres permis.',
        'Alcoolémie zéro.',
      ],
      howToAdvance: 'Après l’étape 3, classe 5 standard sans les règles d’autocollant GDL.',
    ),
  ],
  knowledgeTest: FrKnowledge(
    summary: 'Requis pour le permis d’instruction. Étudiez le guide de l’Î.-P.-É. et confirmez le format actuel à Access PEI.',
  ),
  roadTest: 'Après 365 jours (ou 275 avec formation certifiée), vous pouvez passer l’examen de classe 5 pour l’étape 2.',
  medical: 'Dépistage visuel. Demandez à Access PEI si un rapport médical est requis.',
  identityDocuments: [
    'Voir la page Access PEI « Getting an Instruction Driver’s Permit » pour la liste actuelle.',
  ],
  fees: [
    FrFee(
      label: 'Permis d’instruction, examen et classe 5',
      note: 'Les montants n’étaient pas sur la page GDL consultée. Confirmez à Access PEI.',
    ),
  ],
  otherClasses: [
    'Moto et classes commerciales listées séparément par la Sécurité routière.',
  ],
  sources: [
    FrLink(label: 'Programme de permis progressif', englishOnly: true),
    FrLink(label: 'Permis à l’Î.-P.-É.', englishOnly: true),
  ],
  dataNotes: 'Les règles d’étapes viennent de la page GDL officielle. La note de passage et les tarifs n’y figuraient pas.',
);

const nlFr = FrJurisdiction(
  name: 'Terre-Neuve-et-Labrador',
  authority: 'Division de l’immatriculation des véhicules',
  passengerLicence: 'Classe 5 (5I apprenti, puis 5II novice, puis classe 5)',
  parentalConsent: 'Si vous avez moins de 19 ans à la première demande, un parent ou tuteur doit comparaître et signer (sauf preuve que vous êtes marié ou autonome). Ils peuvent retirer le consentement par écrit jusqu’à 19 ans.',
  stages: [
    FrStage(
      name: 'Niveau I apprenti',
      duration: 'Au moins 12 mois, ou 8 mois avec un programme de conduite approuvé. Le permis 5I est valide deux ans.',
      howToEnter:
          'Avoir 16 ans ou plus, réussir les examens écrit et de vision.',
      restrictions: [
        'Alcoolémie zéro pour l’apprenti et l’accompagnateur.',
        'Accompagné d’un titulaire de classe 5 depuis au moins quatre ans, à l’avant.',
        'Pas d’autres passagers.',
        'Pas de conduite minuit–5 h.',
        'Afficher « NOVICE DRIVER » à l’arrière (lettres noires d’au moins 5 cm sur fond blanc).',
        'Pas de passage aux classes commerciales.',
      ],
      howToAdvance: 'Réussir l’examen sur route.',
    ),
    FrStage(
      name: 'Niveau II novice',
      duration: '12 mois.',
      howToEnter: 'Réussir l’examen pratique après l’attente du niveau I.',
      restrictions: [
        'Alcoolémie zéro.',
        'Entre minuit et 5 h, accompagnateur classe 5 avec au moins quatre ans (exemption de travail si vous pouvez la prouver).',
        'Passagers limités aux ceintures.',
        'Pas de classes commerciales avant d’avoir détenu une classe 5 pleine au moins un an.',
      ],
      howToAdvance: 'Après 12 mois en 5II, vous détenez une classe 5 pleine.',
    ),
    FrStage(
      name: 'Classe 5',
      duration: 'Permis standard après le niveau II.',
      howToEnter: 'Compléter 12 mois en classe 5II.',
      restrictions: ['Les règles adultes de T.-N.-L. s’appliquent.'],
      howToAdvance:
          'Classes commerciales après un an de plus en classe 5 pleine.',
    ),
  ],
  knowledgeTest: FrKnowledge(
    summary: 'Examens de connaissances écrit et de vision pour entrer en classe 5I. Étudiez le Road User’s Guide officiel.',
  ),
  roadTest: 'Après 12 mois en 5I, ou 8 mois avec formation approuvée, pour entrer en 5II.',
  medical: 'Test de vision pour un premier permis. Examens médicaux pour les classes commerciales et sur demande.',
  identityDocuments: [
    'Preuve du nom et de l’âge. Le parent/tuteur doit prouver la tutelle pour un demandeur de moins de 19 ans.',
  ],
  fees: [
    FrFee(
      label: 'Permis de niveau I, examen pratique et carte classe 5',
      note: 'Le barème de la Division n’a pas été vérifié ici. Confirmez les montants avant de payer.',
    ),
  ],
  otherClasses: ['La classe 6 moto a un parcours novice parallèle.'],
  sources: [
    FrLink(label: 'Programme de permis progressif', englishOnly: true),
    FrLink(label: 'Nouveaux conducteurs', englishOnly: true),
  ],
  dataNotes: 'Les règles d’étapes viennent de la page GDL de l’immatriculation. Les tarifs ne sont pas publiés ici.',
);

import 'models.dart';

const bcFr = FrJurisdiction(
  name: 'Colombie-Britannique',
  authority: 'ICBC',
  passengerLicence: 'Classe 5 (via classe 7 L puis N)',
  parentalConsent: 'Un parent ou tuteur doit consentir si vous avez moins de 18 ans. ICBC demande aussi un consentement signé si vous avez moins de 19 ans lorsque vous allez chercher le permis après un examen de connaissances en ligne.',
  stages: [
    FrStage(
      name: 'Apprenti (L)',
      duration: 'Au moins 12 mois si vous avez moins de 25 ans, ou 9 mois si vous avez 25 ans ou plus.',
      howToEnter: 'Avoir au moins 16 ans, réussir l’examen de connaissances ICBC et un test de vision, et présenter des pièces acceptées. Moins de 18 ans : consentement parental.',
      restrictions: [
        'Afficher un panneau L.',
        'Un superviseur qualifié (22 ans ou plus, sans restriction 0 alcool/drogue) doit vous accompagner.',
        'Alcoolémie zéro et concentration de drogue zéro.',
        'Aucun appareil électronique, même mains libres.',
        'Limite d’un passager, avec exception pour la famille immédiate.',
        'Heures restreintes (voir les pages GLP d’ICBC).',
        'ICBC recommande au moins 60 heures de pratique.',
      ],
      howToAdvance: 'Réussir l’examen pratique de classe 7 après le délai minimal d’apprenti.',
    ),
    FrStage(
      name: 'Novice (N)',
      duration: 'Au moins 24 mois consécutifs de conduite sécuritaire si vous avez moins de 25 ans (18 mois si vous avez suivi un cours GLP approuvé pendant l’étape L), ou 12 mois à 25 ans ou plus.',
      howToEnter: 'Réussir l’examen pratique de classe 7.',
      restrictions: [
        'Afficher un panneau N (les règles N et passagers tombent à 25 ans).',
        'Alcoolémie et drogues à zéro.',
        'Aucun appareil électronique, même mains libres.',
        'Moins de 25 ans : un passager (famille immédiate exceptée) sauf si un superviseur de 22 ans ou plus est là.',
        'Aucune interdiction ni condamnation pour appareil électronique ou vitesse excessive pour rester admissible au passage.',
      ],
      howToAdvance: 'Depuis le 19 octobre 2026, un novice au dossier propre passe par une évaluation du dossier de conduite à un bureau ICBC plutôt qu’un second examen pratique. Le permis de classe 5 porte ensuite 0 alcool/drogue pendant 12 mois.',
    ),
    FrStage(
      name: 'Classe 5 avec restrictions, puis classe 5 complète',
      duration: '12 mois de plus à 0 alcool/drogue après l’évaluation du dossier. Ce délai recommence en cas d’interdiction ou de suspension.',
      howToEnter: 'Respecter le temps de novice et le dossier propre, puis faire l’évaluation du dossier de conduite.',
      restrictions: [
        'Alcoolémie et drogues à zéro pendant 12 mois après le passage.',
      ],
      howToAdvance: 'Après ces 12 mois, ICBC délivre une classe 5 pleine si vous restez admissible.',
    ),
  ],
  knowledgeTest: FrKnowledge(
    summary: 'Examen à choix multiples ICBC pour les classes 5/7, en ligne ou en personne. Réussir l’examen ne vous autorise pas à conduire tant qu’ICBC n’a pas délivré le permis au bureau.',
    format: 'En ligne : 45 minutes d’une traite, webcam obligatoire, résultat valide un an. Il faut quand même aller au bureau pour la vision et la carte.',
  ),
  roadTest: 'Examen pratique de classe 7 après l’attente d’apprenti. Réservez seulement auprès d’ICBC. Apportez des pièces acceptées et un véhicule sûr et assuré. Depuis le 19 octobre 2026, un second examen (classe 5) n’est pas exigé des novices au dossier propre.',
  medical: 'Un test de vision est exigé à la délivrance. ICBC peut demander des renseignements médicaux. Les classes commerciales ont des règles distinctes.',
  identityDocuments: [
    'Deux pièces acceptées (liste ICBC).',
    'La même pièce principale que pour l’examen en ligne, le cas échéant.',
    'Preuve que vous résidez en C.-B.',
  ],
  fees: [
    FrFee(
      label: 'Examen de connaissances',
      note: 'ICBC indique 15 \$ pour l’examen en ligne. Confirmez le tarif en personne sur la page des tarifs ICBC.',
    ),
    FrFee(
      label: 'Carte de permis et examens pratiques',
      note: 'Payez la carte au bureau après l’examen de connaissances. Les tarifs d’examen pratique se paient à l’arrivée. Les montants n’étaient pas listés sur la page consultée — confirmez avant de vous déplacer.',
    ),
  ],
  otherClasses: [
    'Moto classes 8 / 6, parcours GLP parallèle.',
    'Classes commerciales 1 à 4 après une classe 5 pleine.',
  ],
  sources: [
    FrLink(label: 'Permis progressif ICBC', englishOnly: true),
    FrLink(label: 'Changements GLP (évaluation du dossier)', englishOnly: true),
    FrLink(label: 'Examen de connaissances en ligne', englishOnly: true),
    FrLink(label: 'Tarifs ICBC', englishOnly: true),
  ],
  dataNotes: 'Les étapes GLP suivent les pages ICBC actuelles, y compris le changement d’octobre 2026. Les tarifs de carte et d’examen pratique ne sont pas cités ici, la page des tarifs n’affichait pas de montants.',
);

const abFr = FrJurisdiction(
  name: 'Alberta',
  authority: 'Transports Alberta et agents de registre',
  passengerLicence: 'Classe 5 (via classe 7 puis classe 5-GDL)',
  minLearnerAgeNote: 'Il faut avoir au moins 16 ans pour l’examen pratique de classe 5-GDL. La classe 5 hors GDL exige 18 ans.',
  parentalConsent: 'Le consentement d’un parent ou tuteur est requis si vous avez moins de 18 ans.',
  stages: [
    FrStage(
      name: 'Apprenti',
      duration: 'Au moins 12 mois avant de pouvoir passer l’examen pratique de classe 5.',
      howToEnter: 'Avoir 14 ans ou plus, réussir un examen de connaissances et un test de vision chez un agent de registre, puis acheter la carte.',
      restrictions: [
        'Conduire un véhicule de classe 5 ou 6 seulement avec un accompagnateur de plus de 18 ans titulaire d’une classe 5 pleine (siège avant). Le cyclomoteur est permis seul.',
        'Pas de conduite entre minuit et 5 h.',
        'Alcool à zéro au volant.',
        'Pas plus de personnes que de ceintures.',
        'Suspension à 8 points de démérite.',
      ],
      howToAdvance: 'À 16 ans ou plus, après 12 mois en classe 7, réussir l’examen pratique et le test de vision.',
    ),
    FrStage(
      name: 'Probatoire GDL',
      duration: '24 mois de conduite probatoire. Un cours de conduite de classe 5 ou 6 approuvé peut réduire jusqu’à 6 mois. Il faut être sans suspension ni démérite pendant les 12 derniers mois pour sortir.',
      howToEnter: 'Réussir l’examen pratique de classe 5 et le test de vision, puis acheter la carte.',
      restrictions: [
        'Alcool et drogues à zéro au volant.',
        'Pas plus de personnes que de ceintures.',
        'Suspension à 8 points.',
        'Ne peut pas superviser un apprenti.',
        'Pas de passage aux classes 1 à 4.',
      ],
      howToAdvance: 'Depuis avril 2023, l’Alberta n’exige plus d’examen pratique avancé pour quitter le GDL. Respecter le temps, l’âge (18+) et le dossier, puis demander au registre.',
    ),
    FrStage(
      name: 'Classe 5 pleine',
      duration: 'Permis d’opérateur standard une fois le GDL terminé.',
      howToEnter: 'Avoir au moins 18 ans, terminer la période probatoire (dont 12 mois sans démérite ni suspension) et satisfaire aux règles de résidence et d’identité.',
      restrictions: [
        'Les règles adultes d’alcool et de démérite s’appliquent.',
      ],
      howToAdvance: 'Vous pourrez plus tard passer aux classes commerciales si vous êtes admissible.',
    ),
  ],
  knowledgeTest: FrKnowledge(
    summary: 'Passé chez un agent de registre. Requis avant une classe 7. Une tentative par jour, payée à chaque fois.',
    passRule: '25 sur 30',
    format: '30 questions à choix multiples.',
  ),
  roadTest: 'Réservez un examen de classe 5 via un agent ou le planificateur albertain. Plus de 75 points d’examen = échec. Le véhicule doit être légal et sûr.',
  medical: 'La vision est testée au registre. L’agent peut demander un rapport médical. Les classes commerciales ont des normes supplémentaires.',
  identityDocuments: [
    'Pièces acceptées, plus preuve que vous vivez en Alberta et au Canada.',
    'Citoyen, résident permanent, visa de travail ou d’études valide, ou demande d’asile acceptée (voir la page de résidence et d’identité).',
  ],
  fees: [
    FrFee(
      label: 'Examen de connaissances (toutes classes)',
      note: 'Catalogue des agents de registre au 1er septembre 2026 : 5 \$ (État) plus jusqu’à 12,60 \$ de frais d’agent.',
    ),
    FrFee(
      label: 'Carte de permis (frais de l’État)',
      note: '17 \$ par année de validité (ex. 85 \$ pour 5 ans), plus frais d’agent plafonnés. Remise possible pour aînés.',
    ),
    FrFee(
      label: 'Examen pratique de classe 5',
      note: 'Alberta.ca indique que les agents fixent et publient leur propre prix. Demandez-le au moment de réserver.',
    ),
  ],
  otherClasses: [
    'Classe 6 moto.',
    'Classes 1 à 4 après une classe 5 hors GDL.',
  ],
  sources: [
    FrLink(label: 'Étapes pour obtenir un permis', englishOnly: true),
    FrLink(label: 'Permis d’apprenti classe 7', englishOnly: true),
    FrLink(label: 'Permis de classe 5', englishOnly: true),
    FrLink(label: 'Examen de connaissances', englishOnly: true),
    FrLink(label: 'Catalogue des tarifs des agents', englishOnly: true),
  ],
  dataNotes: 'Les montants d’examen pratique sont laissés en blanc : l’Alberta laisse les agents les fixer.',
);

const skFr = FrJurisdiction(
  name: 'Saskatchewan',
  authority: 'SGI',
  passengerLicence: 'Classe 5 (apprenti classe 7, puis novice 1 et 2)',
  minLearnerAgeNote: '15 ans si vous suivez ou avez terminé le programme scolaire de conduite.',
  parentalConsent: 'Si vous avez moins de 18 ans et n’avez jamais eu de permis, un parent doit consentir par écrit.',
  stages: [
    FrStage(
      name: 'Apprenti',
      duration: 'Au moins neuf mois de classe 7 valide (les suspensions ne comptent pas).',
      howToEnter: 'Réussir vision, panneaux et examens écrits/oraux, puis acheter le permis chez un émetteur. Les élèves du secondaire peuvent commencer à 15 ans.',
      restrictions: [
        'Un conducteur expérimenté et titulaire doit être à l’avant en tout temps.',
        'Entre minuit et 5 h, les passagers doivent être de la famille immédiate.',
        'Passagers limités au nombre de ceintures.',
        'Aucun téléphone, même mains libres.',
        'Pas de véhicule à volant à droite.',
        'Ne peut pas superviser ni obtenir un permis commercial / autobus scolaire.',
      ],
      howToAdvance: 'Terminer la formation obligatoire, détenir la classe 7 neuf mois, réussir l’examen pratique de classe 5, puis mettre à jour la carte.',
    ),
    FrStage(
      name: 'Novice 1',
      duration: 'Six mois de temps valide.',
      howToEnter:
          'Réussir l’examen pratique de classe 5 et mettre à jour la classe.',
      restrictions: [
        'Un seul passager qui n’est pas de la famille immédiate; les autres doivent l’être, limité aux ceintures.',
        'Aucun téléphone, même mains libres.',
        'Ne peut pas superviser ni obtenir un permis commercial.',
      ],
      howToAdvance: 'Le temps en novice 1, puis novice 2.',
    ),
    FrStage(
      name: 'Novice 2',
      duration: '12 mois sans incident (pas de collision à faute, de déclaration de culpabilité ni de suspension). Un incident recommence les 12 mois.',
      howToEnter: 'Terminer le novice 1.',
      restrictions: [
        'Toujours pas de supervision ni de permis commercial pendant le GDL.',
        'La restriction téléphonique se poursuit pendant le novice (confirmez le libellé actuel du guide SGI).',
      ],
      howToAdvance: 'Passer à une classe 5 expérimentée.',
    ),
  ],
  knowledgeTest: FrKnowledge(
    summary: 'La classe 7 utilise les examens De base et Panneaux. Une fois par jour. Si une partie échoue, on ne reprend que celle-là. Résultats valides un an.',
    format: 'Deux parties : situations/règles et identification des panneaux.',
  ),
  roadTest: 'Après neuf mois en classe 7 et la formation obligatoire. Vous fournissez le véhicule. Il faut mettre à jour la classe chez un émetteur avant de conduire seul.',
  medical: 'Fournir un rapport médical lorsque SGI le demande. Normes de vision pour toutes les classes.',
  identityDocuments: [
    'Preuve originale du nom complet et de la date de naissance.',
    'Document de signature acceptable pour SGI.',
    'Les nouveaux conducteurs de 15 à 18 ans ont besoin du formulaire parental.',
  ],
  fees: [
    FrFee(
      label: 'Examens et carte',
      note: 'Le tableau public des tarifs SGI n’a pas été confirmé. Demandez à un émetteur.',
    ),
  ],
  otherClasses: [
    'Moto et classes commerciales après la sortie du statut novice.',
  ],
  sources: [
    FrLink(label: 'Permis progressif SGI', englishOnly: true),
    FrLink(label: 'Formation obligatoire', englishOnly: true),
    FrLink(label: 'Votre examen', englishOnly: true),
  ],
  dataNotes: 'La structure GDL vient du guide SGI. Les tarifs ne sont pas publiés ici.',
);

const mbFr = FrJurisdiction(
  name: 'Manitoba',
  authority: 'Société d’assurance publique du Manitoba (MPI)',
  passengerLicence: 'Classe 5 (apprenti, intermédiaire, puis plein)',
  minLearnerAgeNote: '15 ans et 6 mois si vous êtes inscrit au programme scolaire Driver Z en cours.',
  parentalConsent:
      'Consentement d’un parent ou tuteur si vous avez moins de 18 ans.',
  stages: [
    FrStage(
      name: 'Apprenti',
      duration: 'Au moins neuf mois de permis valide (suspension, interdiction ou expiration ne comptent pas).',
      howToEnter: 'S’inscrire comme client MPI, réussir l’examen de connaissances et satisfaire aux normes de vision et médicales.',
      restrictions: [
        'Ni drogue ni alcool dans l’organisme au volant.',
        'L’accompagnateur est le seul passager avant, titulaire d’une classe 5 pleine depuis au moins 36 mois, moins de 0,05 d’alcool, capable de passer un dépistage de drogue.',
        'Passagers arrière limités aux ceintures fonctionnelles.',
        'Pas de remorquage, pas de camion agricole de classe 3, pas de VHR le long d’une route (sauf classe 6 intermédiaire déjà détenue).',
      ],
      howToAdvance: 'Réussir l’examen pratique de classe 5. En cas d’échec, attendre au moins 14 jours.',
    ),
    FrStage(
      name: 'Intermédiaire',
      duration: 'Au moins 15 mois de temps valide. Cette étape ne se fait qu’une fois (les classes 5 et 6 se créditent).',
      howToEnter: 'Réussir l’examen pratique de classe 5.',
      restrictions: [
        'Ni drogue ni alcool.',
        '5 h à minuit : un passager à l’avant, arrière limité aux ceintures.',
        'Minuit à 5 h : un passager, ou un superviseur à l’avant plus les passagers arrière selon les ceintures.',
      ],
      howToAdvance: 'Passage automatique à la classe 5 pleine après 15 mois.',
    ),
    FrStage(
      name: 'Plein (trois premières années)',
      duration: 'Les trois premières années d’un permis plein portent encore une règle d’alcool zéro pour les conducteurs entrés au GDL après le 16 décembre 2006.',
      howToEnter: 'Terminer l’étape intermédiaire.',
      restrictions: [
        'Alcool zéro pendant les trois premières années au stade plein (programme GDL moderne).',
        'Vous ne pouvez superviser des apprentis qu’après trois ans au stade plein.',
      ],
      howToAdvance: 'Après trois ans au stade plein, la règle GDL d’alcool zéro prend fin.',
    ),
  ],
  knowledgeTest: FrKnowledge(
    summary: 'Pas à livre ouvert. En cas d’échec, attendre au moins sept jours. Les élèves de moins de 16 ans ont besoin du formulaire de formation.',
  ),
  roadTest: 'Examen pratique de classe 5 pour quitter l’étape apprenti. Échec : attente de 14 jours. Véhicule sûr selon les règles MPI.',
  medical: 'Normes de vision et médicales à la demande. Classes supérieures : règles extra.',
  identityDocuments: [
    'S’inscrire auprès de MPI et présenter les pièces qu’ils acceptent.',
  ],
  fees: [
    FrFee(
      label: 'Examen de connaissances',
      note: '12 \$. Page des tarifs MPI. Exemption possible à 65 ans et plus.',
    ),
    FrFee(
      label: 'Examen pratique classe 5 ou 6',
      note: '35 \$. Page des tarifs MPI.',
    ),
    FrFee(
      label: 'Frais de permis / prime de base / permis',
      note: 'MPI liste 20 \$ / 55 \$ / 12 \$. Confirmez ce qui s’applique à une première carte d’apprenti.',
    ),
  ],
  otherClasses: [
    'La classe 6 moto a ses propres étapes GDL.',
    'Classes 1 à 4 après le stade plein.',
  ],
  sources: [
    FrLink(label: 'Permis progressif MPI', englishOnly: true),
    FrLink(label: 'Obtenir une classe 5', englishOnly: true),
    FrLink(label: 'Tarifs de permis', englishOnly: true),
  ],
  dataNotes: 'Tarifs et étapes GDL tirés des pages publiques actuelles de MPI.',
);

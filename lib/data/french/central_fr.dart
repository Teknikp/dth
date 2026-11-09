import 'models.dart';

const onFr = FrJurisdiction(
  name: 'Ontario',
  authority: 'Ministère des Transports / DriveTest',
  passengerLicence: 'Classe G (via G1 puis G2)',
  parentalConsent: 'La page pour nouveaux conducteurs de l’Ontario ne liste pas un âge distinct de consentement parental pour un premier G1. Apportez des pièces originales. Si vous êtes mineur, confirmez les formulaires auprès de DriveTest.',
  stages: [
    FrStage(
      name: 'G1 (niveau un)',
      duration: 'Habituellement 12 mois. Un cours de conduite approuvé permet l’examen G2 après 8 mois. Vous avez jusqu’à cinq ans pour terminer tout le processus G, sinon vous recommencez.',
      howToEnter: 'Avoir au moins 16 ans, résider en Ontario (pas un visiteur), réussir un test de vision et un examen de connaissances. Depuis le 11 mai 2026, vous devez déclarer que l’Ontario est votre résidence principale et que votre présence au Canada est légale.',
      restrictions: [
        'Alcoolémie zéro.',
        'Chaque passager doit porter une ceinture fonctionnelle.',
        'Pas de conduite entre minuit et 5 h.',
        'Pas d’autoroutes de la série 400 ni des voies rapides nommées (QEW, Gardiner, Don Valley Parkway, et autres listées par le MTO), sauf si l’accompagnateur est un instructeur certifié.',
        'Accompagnateur : classe G (ou plus), au moins quatre ans d’expérience, alcoolémie sous 0,05 (zéro s’il a 21 ans ou moins). Seule autre personne à l’avant.',
      ],
      howToAdvance: 'Réussir l’examen pratique G2 (sortie du G1).',
    ),
    FrStage(
      name: 'G2 (niveau deux)',
      duration: 'Au moins 12 mois.',
      howToEnter: 'Réussir l’examen pratique G2.',
      restrictions: [
        'Alcoolémie zéro.',
        'Passagers limités aux ceintures fonctionnelles.',
        'Vous pouvez conduire seul, sur toutes les routes, à toute heure — sauf limites de passagers la nuit si vous avez 19 ans ou moins.',
        'G2 de 19 ans ou moins : pendant les six premiers mois, un seul passager de 19 ans ou moins entre minuit et 5 h. Ensuite le plafond nocturne augmente (voir la page Ontario). La famille immédiate et un accompagnateur qualifié sont traités autrement — lisez la page officielle.',
      ],
      howToAdvance: 'Réussir l’examen pratique G complet.',
    ),
    FrStage(
      name: 'G complet',
      duration: 'Classe G standard après le second examen pratique.',
      howToEnter: 'Réussir l’examen G après au moins 12 mois en G2.',
      restrictions: [
        'Les règles adultes de l’Ontario s’appliquent, y compris les limites d’alcool selon l’âge.',
      ],
      howToAdvance:
          'Les autres classes (M, commercial) ont leurs propres examens.',
    ),
  ],
  knowledgeTest: FrKnowledge(
    summary: 'Examen à choix multiples du MTO sur les règles et les panneaux. Non chronométré jusqu’à la fermeture du centre. Anglais et français; le G1 est offert en 32 langues. Résultats immédiats. Tentatives supplémentaires payantes. Valides un an; dans l’année, on ne reprend que les sections échouées.',
    passRule: 'Au moins 80 % au total',
    format: 'Deux ou trois sections (souvent panneaux et règles).',
  ),
  roadTest: 'L’examen G2 couvre les habiletés de base. L’examen G plus tard couvre l’autoroute et des manœuvres avancées. Réservez à DriveTest. Apportez un véhicule sûr.',
  medical: 'Un test de vision est exigé pour un premier G1. Un rapport médical est requis pour certaines conditions et les classes commerciales.',
  identityDocuments: [
    'Preuve originale et valide du nom légal et de la date de naissance (jour, mois, année). Photocopies et documents expirés refusés.',
    'Exemples listés par l’Ontario : passeport, carte-photo de l’Ontario, carte de citoyenneté avec photo, certificat sécurisé de statut d’Indien, carte RP, ou documents d’immigration listés — suivez la liste officielle.',
  ],
  fees: [
    FrFee(
      label: 'Forfait permis G1',
      note: 'DriveTest : 159,75 \$ — examen de connaissances, un examen G2 et un permis de cinq ans, payé à la demande.',
    ),
    FrFee(
      label: 'Examen de connaissances (tentative extra)',
      note: '16,00 \$. Page des tarifs DriveTest.',
    ),
    FrFee(
      label: 'Examen pratique G2 (tentative extra)',
      note: '53,75 \$. Page des tarifs DriveTest.',
    ),
    FrFee(
      label: 'Examen pratique G',
      note: '91,25 \$. Non inclus dans le forfait G1.',
    ),
    FrFee(
      label: 'Permis de cinq ans seulement',
      note: '90,00 \$. Page des tarifs DriveTest.',
    ),
  ],
  otherClasses: [
    'La classe M moto a un parcours M1/M2/M parallèle.',
    'Classes commerciales (A à F) : examens extra, souvent un examen médical.',
  ],
  sources: [
    FrLink(
      label: 'Obtenir un permis G (nouveaux conducteurs)',
      englishOnly: true,
    ),
    FrLink(label: 'Examens de connaissances DriveTest', englishOnly: true),
    FrLink(label: 'Tarifs DriveTest', englishOnly: true),
    FrLink(label: 'Pièces acceptées', englishOnly: true),
  ],
  dataNotes: 'Le détail des passagers la nuit pour les G2 de 19 ans ou moins est résumé; lisez la page Ontario pour le palier de six mois et les exceptions familiales.',
);

const qcFr = FrJurisdiction(
  name: 'Québec',
  authority: 'SAAQ',
  passengerLicence: 'Classe 5 (apprenti, puis probatoire, puis régulier)',
  parentalConsent: 'Consentement écrit d’un parent ou tuteur si vous avez moins de 18 ans. La SAAQ indique que ce consentement est valide administrativement six mois à compter de la signature.',
  stages: [
    FrStage(
      name: 'Permis d’apprenti',
      duration: 'Au moins 12 mois.',
      howToEnter: 'Avoir 16 ans ou plus, résider principalement au Québec, avoir le droit de séjourner au Canada plus de six mois, terminer la phase 1 d’un cours de conduite reconnu, réussir le test de vision SAAQ, remplir la déclaration de maladie ou déficience, et présenter des pièces.',
      restrictions: [
        'Accompagné en tout temps par une personne autorisée à l’avant.',
        'Pas de conduite entre minuit et 5 h.',
        'Pas de conduite après consommation d’alcool ou de drogue.',
        'Quatre points d’inaptitude ou plus révoquent le permis; attente de trois mois ensuite.',
      ],
      howToAdvance: 'Terminer le cours reconnu, réussir les examens de connaissances SAAQ (admissible après 10 mois d’apprenti), puis l’examen pratique après 12 mois.',
    ),
    FrStage(
      name: 'Permis probatoire',
      duration: '24 mois de temps probatoire valide. Le permis n’est pas renouvelable; vous obtenez ensuite un permis régulier.',
      howToEnter: 'Réussir les examens de connaissances et pratique et présenter l’attestation de toutes les phases du cours.',
      restrictions: [
        'Alcool et drogues à zéro au volant.',
        'Ne peut pas accompagner un apprenti.',
        'Révocation à quatre points ou plus (puis un délai d’attente).',
        'Titulaires de 19 ans ou moins : limites de passagers de 19 ans ou moins entre minuit et 5 h (un passager les 6 premiers mois, jusqu’à trois entre 6 et 12 mois). La famille immédiate est exclue de ce décompte.',
      ],
      howToAdvance: 'Détenir un permis probatoire valide 24 mois, puis obtenir une classe 5 régulière.',
    ),
    FrStage(
      name: 'Classe 5 régulière',
      duration: 'Permis SAAQ standard.',
      howToEnter: 'Terminer les 24 mois probatoires.',
      restrictions: [
        'Les règles du Code de la sécurité routière s’appliquent, y compris les limites d’alcool selon l’âge et le type de permis.',
      ],
      howToAdvance: 'Les autres classes (moto, freins pneumatiques, commercial) ont des cours et examens extra.',
    ),
  ],
  knowledgeTest: FrKnowledge(
    summary: 'Les examens de connaissances SAAQ portent sur la réglementation, la signalisation et les comportements. Prenez rendez-vous dans un centre SAAQ. Il faut détenir le permis d’apprenti depuis au moins 10 mois. En cas d’échec, la SAAQ exige au moins 28 jours avant une autre tentative.',
    format: 'Pendant le cours obligatoire. Les notes de passage exactes sont fixées par la SAAQ — confirmez au moment de réserver.',
  ),
  roadTest: 'Admissible après 12 mois d’apprenti, un examen de connaissances réussi et l’attestation du cours. Échec : au moins 28 jours. Apportez un véhicule sûr, l’immatriculation et l’assurance.',
  medical: 'Test de vision plus la déclaration de maladie ou déficience. La SAAQ peut exiger un examen médical ou visuel.',
  identityDocuments: [
    'Deux pièces d’identité de la liste SAAQ.',
    'Attestation de l’école (phase 1 pour l’apprenti; toutes les phases pour l’examen pratique).',
    'Formulaire de consentement parental si vous êtes mineur.',
  ],
  fees: [
    FrFee(
      label: 'Permis d’apprenti, examens et permis probatoire',
      note: 'La SAAQ publie les tarifs à jour sur son site (ils changent avec la contribution d’assurance). Vérifiez avant de payer.',
    ),
  ],
  otherClasses: [
    'Les classes moto 6A/6B/6C suivent aussi un parcours probatoire.',
    'Cyclomoteur (6D) et tracteur (8) : âges minimaux plus bas.',
    'Classes commerciales : qualifications extra.',
  ],
  sources: [
    FrLink(label: 'Admissibilité classe 5 SAAQ'),
    FrLink(label: 'Guide de l’automobiliste SAAQ (PDF)'),
    FrLink(label: 'Accueil SAAQ'),
  ],
  dataNotes: 'Le Québec exige une école de conduite reconnue pour la classe 5 — ce n’est pas facultatif. Les tarifs sont omis jusqu’à confirmation d’un tableau officiel.',
);

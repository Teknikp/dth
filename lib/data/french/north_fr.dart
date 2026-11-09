import 'models.dart';

const ytFr = FrJurisdiction(
  name: 'Yukon',
  authority: 'Véhicules automobiles du Yukon',
  passengerLicence: 'Classe 5 (apprenti classe 7, puis novice classe 5)',
  minLearnerAgeNote: 'Il faut avoir au moins 16 ans, 6 mois d’apprenti et 50 heures consignées avant l’examen pratique de classe 5.',
  parentalConsent: 'Si vous avez moins de 18 ans, un parent ou tuteur doit vous accompagner et prouver son identité.',
  stages: [
    FrStage(
      name: 'Apprenti',
      duration:
          'Minimum 6 mois, avec au moins 50 heures de pratique consignées.',
      howToEnter: 'Avoir 15 ans ou plus, présenter une pièce valide et une preuve de résidence au Yukon, réussir l’examen écrit et un test de vision.',
      restrictions: [
        'Alcool et drogues à zéro pour vous et l’accompagnateur.',
        'L’accompagnateur détient une classe 5 (ou plus) depuis au moins 2 ans et doit être là chaque fois que vous conduisez.',
        'Conduire seulement entre 5 h et minuit.',
        'Afficher un panneau L à l’arrière.',
        'Limité à 2 passagers y compris l’accompagnateur, sauf famille immédiate.',
        'Tout le monde porte la ceinture.',
        'Voitures ou camionnettes seulement, PNBV inscrit d’au plus 4 000 kg, 7 places max. y compris le conducteur.',
        'Aucun appareil électronique, même mains libres.',
        'Pas de remorque.',
      ],
      howToAdvance: 'À 16 ans ou plus, après 6 mois et 50 heures, réussir l’examen pratique de classe 5.',
    ),
    FrStage(
      name: 'Novice',
      duration: 'Au moins 18 mois consécutifs sans violer les restrictions GDL. Une infraction remet le délai à zéro.',
      howToEnter: 'Réussir l’examen pratique de classe 5 (environ 30 minutes).',
      restrictions: [
        'Alcool et drogues à zéro.',
        'Un accompagnateur est requis entre minuit et 5 h (sauf exemption du registraire). L’accompagnateur est aussi à tolérance zéro.',
        'Aucun appareil électronique, même mains libres.',
        'Véhicules de tourisme seulement, jusqu’à 4 000 kg PNBV et 9 places y compris le conducteur.',
        'Passagers limités aux ceintures; personne dans la caisse d’un camion.',
      ],
      howToAdvance:
          'Demander une classe 5 pleine après 18 mois propres comme novice.',
    ),
    FrStage(
      name: 'Classe 5 pleine',
      duration: 'Classe 5 standard du Yukon.',
      howToEnter: 'Terminer l’étape novice et présenter une demande.',
      restrictions: [
        'Les règles adultes du Yukon s’appliquent. Sept points de démérite suspendent un permis GDL un mois.',
      ],
      howToAdvance: 'Autres classes après une classe 5 pleine.',
    ),
  ],
  knowledgeTest: FrKnowledge(
    summary: 'Examen écrit dans un bureau des véhicules. Étudiez le Yukon Driver’s Basic Handbook. En cas d’échec, nouvelle tentative dès le lendemain.',
  ),
  roadTest: 'Réservez au bureau. Payez l’examen à la réservation. Apportez un véhicule sûr, immatriculé et assuré, votre permis et un accompagnateur valide. Les examens de classe 5 se réservent après dépôt du carnet de pratique.',
  medical: 'Test de vision obligatoire. Sinon, examen chez un optométriste ou ophtalmologiste. Lunettes ou lentilles, le cas échéant, deviennent une restriction.',
  identityDocuments: [
    'Pièce valide et preuve que vous résidez au Yukon.',
    'Pièce du parent/tuteur si vous avez moins de 18 ans.',
  ],
  fees: [
    FrFee(
      label: 'Examen de connaissances écrit',
      note: '20 \$. Yukon.ca. Payé à chaque reprise.',
    ),
    FrFee(label: 'Examen pratique', note: '20 \$. Yukon.ca.'),
    FrFee(
      label: 'Carte de permis',
      note: 'Le montant de la carte n’était pas sur la même page. Confirmez au bureau.',
    ),
  ],
  otherClasses: [
    'Moto et classes commerciales décrites dans le guide après la classe 5.',
  ],
  sources: [
    FrLink(label: 'Obtenir un permis', englishOnly: true),
    FrLink(label: 'Guide de base du conducteur du Yukon', englishOnly: true),
  ],
  dataNotes: 'Les restrictions GDL suivent Yukon.ca et le chapitre 9 du guide de 2023.',
);

const ntFr = FrJurisdiction(
  name: 'Territoires du Nord-Ouest',
  authority: 'Services aux conducteurs et véhicules des T.N.-O.',
  passengerLicence: 'Classe 5 (apprenti classe 7, puis 5P, puis classe 5)',
  minLearnerAgeNote: 'Il faut avoir au moins 16 ans pour entrer à l’étape probatoire classe 5P.',
  parentalConsent: 'Apportez une preuve du nom légal et de la date de naissance. Confirmez tout formulaire extra pour les moins de 18 ans au bureau — les premiers permis sont en personne seulement.',
  stages: [
    FrStage(
      name: 'Apprenti',
      duration: 'Au moins un an, sans suspension.',
      howToEnter: 'Avoir 15 ans ou plus, réussir le dépistage visuel et un examen de connaissances.',
      restrictions: [
        'Conduire seulement avec un superviseur pleinement titulaire ayant au moins 24 mois sur une classe 5 pleine.',
        'Pas de conduite 23 h–6 h.',
        'Pas de passagers autres que le superviseur.',
        'Conducteur et superviseur : alcoolémie zéro.',
        'Six points ou plus peuvent mener le registraire à une suspension.',
      ],
      howToAdvance: 'À 16 ans ou plus, après une année de classe 7 sans suspension, réussir l’examen pratique pour la 5P.',
    ),
    FrStage(
      name: 'Probatoire',
      duration: '12 mois sans suspension. Le passage à la classe 5 pleine n’est pas automatique.',
      howToEnter: 'Avoir 16 ans ou plus, terminer la classe 7 sans suspension, et réussir l’examen pratique.',
      restrictions: [
        'Pas de passage aux classes commerciales 1 à 4 pendant cette année.',
        'Une condamnation pour conduite avec facultés affaiblies ou six points ou plus suspendent le permis.',
      ],
      howToAdvance: 'Visiter un bureau en personne pour passer à la classe 5 ou 6 pleine.',
    ),
    FrStage(
      name: 'Classe 5 pleine',
      duration: 'Permis standard des T.N.-O. après la demande.',
      howToEnter: 'Compléter 12 mois sans suspension en 5P et présenter une demande en personne.',
      restrictions: ['Les règles adultes des T.N.-O. s’appliquent.'],
      howToAdvance: 'Classes commerciales après une classe 5 pleine et les règles médicales.',
    ),
  ],
  knowledgeTest: FrKnowledge(
    summary: 'Réservez un examen écrit au bureau. Une pièce photo est exigée. Étudiez le manuel des T.N.-O.',
  ),
  roadTest: 'Un examen pratique est requis pour passer de la classe 7 à la 5P.',
  medical: 'Dépistage visuel pour un premier permis. Pages distinctes pour les exigences médicales commerciales.',
  identityDocuments: [
    'Preuve du nom légal, de la date de naissance et pièce photo acceptable.',
    'Preuve de résidence aux T.N.-O.',
    'Formulaire de demande rempli.',
  ],
  fees: [
    FrFee(
      label: 'Nouveau permis de 5 ans',
      note: '110 \$ (aînés 60+ : 54 \$). La page liste aussi un second barème un peu plus bas. Confirmez le jour de la demande.',
    ),
    FrFee(
      label: 'Nouveau permis de 3 ans',
      note: '84 \$ (aînés : 43 \$). Confirmez le jour de la demande.',
    ),
    FrFee(
      label: 'Nouveau permis de 1 an',
      note: '46 \$ (aînés : 23 \$). Confirmez le jour de la demande.',
    ),
    FrFee(
      label: 'Examens de connaissances et pratique',
      note: 'Les tarifs d’examen n’étaient pas sur la page du premier permis. Demandez-les à la réservation.',
    ),
  ],
  otherClasses: [
    'La classe 6 moto utilise la 6P en parallèle.',
    'Classes 1 à 4 après la classe 5 pleine, avec formation d’entrée le cas échéant.',
  ],
  sources: [
    FrLink(label: 'Obtenir un permis pour la première fois', englishOnly: true),
    FrLink(label: 'Manuels du conducteur des T.N.-O.', englishOnly: true),
  ],
  dataNotes: 'Les étapes GDL viennent de la page officielle du premier permis. Cette page liste deux barèmes de carte — à vérifier le jour même.',
);

const nuFr = FrJurisdiction(
  name: 'Nunavut',
  authority: 'Véhicules automobiles du Nunavut',
  passengerLicence: 'Classe 5 (apprenti classe 7, puis classe 5)',
  minLearnerAgeNote: 'Les classes 5 et 6 exigent au moins 16 ans et un permis d’apprenti valide.',
  parentalConsent: 'Confirmez le processus actuel pour les moins de 18 ans chez votre fournisseur local. Les demandes sont en personne.',
  stages: [
    FrStage(
      name: 'Apprenti',
      duration: 'Le Nunavut ne publie pas d’horaire GDL pluriannuel comme la plupart des provinces. Le règlement exige un accompagnateur qualifié. Le manuel restreint indique qu’un premier conducteur doit pratiquer au moins quatre semaines avant l’examen de classe 5 ou 6.',
      howToEnter: 'Avoir 15 ans ou plus, réussir un examen écrit et la norme de vision, et présenter une pièce convenable.',
      restrictions: [
        'Vous devez être accompagné d’une personne titulaire pour ce type de véhicule. Pour la classe 5, l’accompagnateur a besoin d’au moins deux ans d’expérience (trois ans s’il détient une classe 1 à 4 pour ce type). Il doit vous enseigner.',
        'Les apprentis moto ont des limites extra de nuit et de zone de vitesse dans le règlement.',
      ],
      howToAdvance: 'À 16 ans, avec un permis d’apprenti valide, réussir les examens de connaissances (s’ils sont encore requis), la vision et un examen pratique.',
    ),
    FrStage(
      name: 'Classe 5',
      duration: 'Classe 5 standard. Aucune étape novice/intermédiaire distincte n’a été trouvée sur les pages actuelles.',
      howToEnter: '16 ans, permis d’apprenti valide, connaissances, vision et examen pratique.',
      restrictions: [
        'Les règles adultes du Nunavut s’appliquent.',
        'Un examen médical du conducteur est requis à 75 ans, à 80 ans, puis tous les deux ans après 80 ans pour les classes 5, 6 ou 7.',
      ],
      howToAdvance: 'Classes 1 à 4 dès 18 ans avec une classe 5, médical, connaissances, vision, inspection avant départ et examen pratique.',
    ),
  ],
  knowledgeTest: FrKnowledge(
    summary: 'Examen écrit pour la classe 7, et de nouveau au besoin pour 5/6. Étudiez le manuel du Nunavut. Un interprète peut être permis à la discrétion de l’examinateur.',
  ),
  roadTest: 'Requis pour les classes 5 et 6. Les premiers conducteurs ont besoin d’au moins quatre semaines de pratique. Après un échec, pratiquez au moins deux semaines. Apportez assurance, immatriculation, plaque et un véhicule sûr de la bonne classe.',
  medical: 'Normes de vision pour 5, 6 et 7. Les lentilles correctrices deviennent une mention. Classes commerciales : examen médical. Examens selon l’âge dès 75 ans pour 5–7.',
  identityDocuments: [
    'Bordereau de demande rempli.',
    'Deux pièces acceptables (passeport, permis actuel, certificat de naissance, etc.).',
  ],
  fees: [
    FrFee(
      label: 'Demande, examens et carte',
      note: 'Les pages consultées ne publient pas de barème public actuel. Demandez à votre fournisseur local.',
    ),
  ],
  otherClasses: [
    'Classe 6 moto; classes 1 à 4 commerciales dès 18 ans.',
    'Les nouveaux résidents doivent demander dans les 30 jours. Un permis expiré depuis plus de 12 mois exige généralement un examen.',
  ],
  sources: [
    FrLink(label: 'Demander un permis', englishOnly: true),
    FrLink(label: 'Manuel du conducteur du Nunavut (PDF)', englishOnly: true),
    FrLink(label: 'Règlement sur les permis de conduire', englishOnly: true),
  ],
  dataNotes: 'Portrait GDL le plus mince des 13 : pas de programme L/N pluriannuel publié. Les délais au-delà de la note de quatre semaines viennent d’un manuel plus ancien et du règlement. Les tarifs ne sont pas publiés. Traitez ceci comme un pointeur vers Véhicules automobiles, pas une liste complète.',
);

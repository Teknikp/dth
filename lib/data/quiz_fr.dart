class FrQuestion {
  const FrQuestion({
    required this.prompt,
    required this.choices,
    required this.explanation,
    required this.topic,
    this.sourceNote = 'Question d’étude non officielle, basée sur des sujets courants des guides.',
  });

  final String prompt;
  final List<String> choices;
  final String explanation;
  final String topic;
  final String sourceNote;
}

const Map<String, FrQuestion> quizFr = {
  'sign-stop': FrQuestion(
    prompt: 'Que signifie ce panneau?',
    choices: [
      'Ralentir et continuer si la voie semble libre',
      'Immobilisation complète, puis partir seulement lorsque c’est sûr',
      'S’arrêter seulement s’il y a d’autres véhicules',
      'Céder le passage, mais un arrêt roulant est permis la nuit',
    ],
    explanation: 'C’est un panneau d’arrêt. Arrêt complet avant la ligne ou le passage, regarder, puis partir à votre tour lorsque c’est sûr.',
    topic: 'Panneaux',
  ),
  'sign-yield': FrQuestion(
    prompt: 'Que signifie ce panneau?',
    choices: [
      'Arrêt, puis départ comme à un feu vert',
      'Zone scolaire plus loin',
      'Céder le passage',
      'Entrée interdite',
    ],
    explanation: 'C’est un cédez-le-passage. Ralentissez, soyez prêt à arrêter, et cédez aux usagers qui ont priorité.',
    topic: 'Panneaux',
  ),
  'sign-warning': FrQuestion(
    prompt: 'Que vous indique ce panneau?',
    choices: [
      'Une prescription à respecter, comme une limite de vitesse',
      'Un danger ou un changement de route plus loin — préparez-vous',
      'Une aire de loisirs',
      'Un hôpital',
    ],
    explanation: 'Les losanges jaunes sont des panneaux de danger. Ils ne remplacent pas un arrêt ou une limite; ils vous demandent de vous préparer.',
    topic: 'Panneaux',
  ),
  'sign-do-not-enter': FrQuestion(
    prompt: 'Que signifie ce panneau?',
    choices: [
      'Entrée interdite',
      'Arrêt interdit',
      'Passage à niveau',
      'Chaussée qui rétrécit',
    ],
    explanation: 'C’est le panneau d’entrée interdite / sens interdit. N’empruntez pas cette voie — souvent aux bretelles de sortie et aux rues à sens unique.',
    topic: 'Panneaux',
  ),
  'sign-flashing-red': FrQuestion(
    prompt: 'Que signifie ce feu?',
    choices: [
      'Comme un feu vert si l’intersection paraît vide',
      'Ralentir à 20 km/h et continuer',
      'Le traiter comme un arrêt : s’arrêter, puis partir lorsque c’est sûr',
      'S’arrêter et attendre qu’il redevienne vert',
    ],
    explanation: 'Les guides traitent le rouge clignotant comme un arrêt. Arrêt complet, cédez, puis partez. Un rouge fixe est différent : on attend le vert (le virage à droite au rouge n’est pas toujours permis).',
    topic: 'Panneaux',
  ),
  'sign-flashing-yellow': FrQuestion(
    prompt: 'Que signifie ce feu?',
    choices: [
      'S’arrêter comme à un panneau d’arrêt',
      'Traverser l’intersection avec prudence',
      'Le feu est hors service; demi-tour seulement',
      'Accélérer pour dégager l’intersection',
    ],
    explanation: 'Le jaune clignotant : ralentir, regarder, avancer avec prudence. Cédez à quiconque est déjà dans l’intersection ou s’apprête à y entrer avec priorité.',
    topic: 'Panneaux',
  ),
  'sign-school': FrQuestion(
    prompt: 'Que marque ce panneau?',
    choices: [
      'Une zone scolaire ou une traverse — surveillez les enfants',
      'Un hôpital',
      'Une zone de travaux',
      'Un parc provincial',
    ],
    explanation: 'Ce pentagone est l’avertissement d’école / traversée scolaire du manuel canadien de signalisation. Réduisez la vitesse et surveillez les enfants. La limite affichée est un panneau distinct.',
    topic: 'Panneaux',
  ),
  'sign-rail': FrQuestion(
    prompt: 'Que devez-vous faire en voyant ce panneau?',
    choices: [
      'Ralentir un peu et continuer; le train klaxonnera',
      'S’arrêter seulement si vous voyez un train',
      'Regarder, écouter, et s’arrêter si un train approche ou si les signaux l’exigent',
      'Rétrograder et traverser vite sans regarder',
    ],
    explanation: 'Traitez chaque passage comme actif. Si les feux, cloches ou un signaleur disent d’arrêter — arrêtez. Ne contournez jamais des barrières baissées. Un train ne s’arrête pas vite.',
    topic: 'Panneaux',
  ),
  'sign-solid-yellow': FrQuestion(
    prompt: 'Que signifie ce marquage de votre côté?',
    choices: [
      'Le dépassement est permis si vous klaxonnez d’abord',
      'Le dépassement n’est pas permis de votre côté',
      'La voie est réservée aux vélos',
      'Vous devez rouler au moins 20 km/h sous la limite',
    ],
    explanation: 'Une jaune continue de votre côté : ne dépassez pas. Une jaune discontinue permet souvent le dépassement si la voie est libre. Vérifiez toujours le marquage local.',
    topic: 'Panneaux',
  ),
  'sign-speed-regulatory': FrQuestion(
    prompt: 'Que signifie ce panneau?',
    choices: [
      'Une vitesse suggérée par beau temps seulement',
      'Une limite réglementaire à respecter, sauf si une vitesse plus basse est nécessaire pour la sécurité',
      'La vitesse minimale de cette route',
      'Un conseil pour les camions lourds seulement',
    ],
    explanation: 'Les limites affichées sont réglementaires. La météo, la visibilité et la circulation peuvent encore exiger d’aller plus lentement. Les défauts urbain/rural varient selon la province.',
    topic: 'Panneaux',
  ),
  'rules-seatbelt': FrQuestion(
    prompt: 'Qui doit porter la ceinture dans un véhicule de tourisme (si des ceintures sont installées)?',
    choices: [
      'Le conducteur seulement',
      'Seuls les passagers de moins de 16 ans',
      'Le conducteur et tous les passagers, selon la loi provinciale ou territoriale',
      'Seules les personnes à l’avant',
    ],
    explanation: 'Chaque province et territoire canadien exige le port de la ceinture lorsqu’elle est disponible. Le conducteur est souvent responsable des jeunes passagers. Les sièges d’enfant ont des règles extra.',
    topic: 'Règles',
  ),
  'rules-four-way': FrQuestion(
    prompt: 'À un arrêt à quatre voies, la priorité habituelle est :',
    choices: [
      'Le plus gros véhicule part le premier',
      'Le premier arrivé part le premier; à égalité, cédez à droite',
      'Le nord–sud part toujours le premier',
      'Celui qui clignote les phares a priorité',
    ],
    explanation: 'Les guides enseignent : premier arrêté, premier parti; à arrivée simultanée, cédez au conducteur à votre droite. Ne supposez pas que l’autre va bouger.',
    topic: 'Règles',
  ),
  'rules-school-bus': FrQuestion(
    prompt: 'Lorsqu’un autobus scolaire a les feux rouges et le bras d’arrêt sorti, vous devez :',
    choices: [
      'Ralentir à 30 km/h et dépasser prudemment',
      'Vous arrêter (des deux sens sur une route non divisée) jusqu’à ce que les feux s’éteignent et que le bras rentre',
      'Dépasser si vous êtes de l’autre côté d’une ligne peinte',
      'Klaxonner pour montrer que vous voyez les enfants',
    ],
    explanation: 'Sur une route non divisée, arrêt des deux sens. Les routes divisées avec terre-plein physique sont parfois traitées autrement — connaissez la règle locale, mais ne dépassez jamais un autobus au bras sorti sur une route non divisée.',
    topic: 'Règles',
  ),
  'rules-emergency': FrQuestion(
    prompt: 'Lorsqu’un véhicule d’urgence approche gyrophare et sirène, vous devez :',
    choices: [
      'Vous arrêter tout de suite dans la voie',
      'Accélérer pour dégager, puis garder la vitesse',
      'Signaler, serrer le plus à droite possible en sécurité, et vous arrêter jusqu’à ce qu’il soit passé',
      'Le suivre de près pour emprunter son chemin',
    ],
    explanation: 'Dégagez la voie. Serrez à droite et arrêtez. Ne bloquez pas les intersections. Restez arrêtés jusqu’à ce que le véhicule soit passé. Plusieurs endroits exigent aussi de ralentir et de changer de voie près d’un véhicule d’urgence ou d’une dépanneuse arrêté.',
    topic: 'Règles',
  ),
  'rules-following': FrQuestion(
    prompt: 'Une distance minimale souvent enseignée par beau temps est :',
    choices: [
      'Environ une longueur de véhicule, quelle que soit la vitesse',
      'Un intervalle de deux à trois secondes (plus si les conditions sont mauvaises)',
      'Une demi-seconde si les freins sont neufs',
      'Aucun intervalle n’est nécessaire sous 40 km/h',
    ],
    explanation: 'La règle des deux ou trois secondes figure dans la plupart des guides : choisissez un repère; au moins deux à trois secondes doivent passer avant que vous l’atteigniez. Augmentez l’écart sous la pluie, la neige, la nuit, ou si on vous colle.',
    topic: 'Règles',
  ),
  'rules-crosswalk': FrQuestion(
    prompt: 'À un passage pour piétons marqué sans feux, vous devez :',
    choices: [
      'Ralentir seulement si un piéton a déjà commencé de votre côté',
      'Céder aux piétons qui sont dans le passage ou s’apprêtent à y entrer, selon la loi locale',
      'Faire signe aux piétons tout en continuant à rouler',
      'Ne jamais s’arrêter, de peur d’une collision arrière',
    ],
    explanation: 'Les conducteurs doivent céder aux piétons aux passages marqués (et souvent aux intersections non marquées). Arrêtez assez loin pour que les autres voies voient le piéton. Ne dépassez pas un véhicule arrêté à un passage.',
    topic: 'Règles',
  ),
  'rules-blind-spot': FrQuestion(
    prompt: 'Avant de changer de voie, vous devez :',
    choices: [
      'Vérifier les rétros, signaler, et vérifier l’angle mort par-dessus l’épaule, puis bouger si c’est libre',
      'Signaler après être entré dans la nouvelle voie',
      'Vous fier seulement à une caméra de recul',
      'Klaxonner et bouger tout de suite',
    ],
    explanation: 'Les rétros ne montrent pas l’angle mort. Les guides enseignent : rétros, clignotant, épaule, puis mouvement si l’écart est sûr. Annulez le clignotant après.',
    topic: 'Règles',
  ),
  'rules-red-right': FrQuestion(
    prompt: 'Tourner à droite à un feu rouge est :',
    choices: [
      'Toujours légal au Canada après un arrêt',
      'Jamais légal au Canada',
      'Permis à beaucoup d’endroits après un arrêt complet, sauf panneau l’interdisant — mais certaines villes et intersections le bannissent',
      'Permis seulement pour les autobus',
    ],
    explanation: 'Le droit au rouge n’est pas universel. Plusieurs administrations le permettent après un arrêt complet, sauf panneau. Certaines municipalités le restreignent. Arrêtez d’abord, cédez, respectez les interdictions. Cette appli ne dira pas que c’est légal à un coin précis.',
    topic: 'Règles',
  ),
  'rules-space': FrQuestion(
    prompt: 'Si on vous colle de trop près, une réaction plus sûre est de :',
    choices: [
      'Freiner pour « avertir » l’autre conducteur',
      'Augmenter votre propre distance de suivi et, si c’est sûr, changer de voie ou vous ranger pour le laisser passer',
      'Accélérer bien au-dessus de la limite',
      'Bloquer les deux voies pour l’empêcher de dépasser',
    ],
    explanation: 'Donnez-vous plus d’espace devant pour ralentir progressivement. Laissez passer le colleur lorsque c’est sûr. N’escaladez pas. Un freinage brusque peut causer une collision dont vous ferez partie.',
    topic: 'Règles',
  ),
  'rules-roundabout': FrQuestion(
    prompt: 'En entrant dans un carrefour giratoire, vous devez :',
    choices: [
      'Vous arrêter dans l’anneau pour forcer un intervalle',
      'Céder aux véhicules déjà dans l’anneau, puis entrer lorsqu’il y a un écart sûr',
      'Toujours faire un arrêt complet même si l’anneau est vide',
      'Entrer à côté d’un autre véhicule et calquer sa vitesse',
    ],
    explanation: 'Cédez aux véhicules déjà en circulation (généralement à votre gauche au Canada). Signalez en sortant. Ne vous arrêtez pas dans l’anneau sauf pour éviter une collision.',
    topic: 'Règles',
  ),
  'alc-criminal': FrQuestion(
    prompt: 'Selon le Code criminel du Canada, le seuil d’alcoolémie d’une infraction pour un adulte pleinement titulaire est :',
    choices: [
      '0,02 % (20 mg/100 ml)',
      '0,08 % (80 mg/100 ml)',
      '0,15 % (150 mg/100 ml)',
      'Il n’y a pas d’infraction fédérale — seulement des amendes provinciales',
    ],
    explanation: 'Conduire avec 80 mg d’alcool par 100 ml de sang (0,08) ou plus est une infraction criminelle. Les provinces et territoires imposent aussi des sanctions administratives à des niveaux plus bas (souvent 0,05). Les permis progressifs sont généralement à zéro.',
    topic: 'Facultés affaiblies',
  ),
  'alc-gdl-zero': FrQuestion(
    prompt: 'Pour la plupart des permis d’apprenti / novice / progressifs au Canada, la règle d’alcool au volant est :',
    choices: [
      'La même limite criminelle de 0,08 que les adultes pleinement titulaires',
      'Zéro — tout alcool détectable peut mener à une suspension routière ou pire',
      'Un verre standard par heure est permis',
      'La bière est permise; les spiritueux non',
    ],
    explanation: 'Les programmes GDL exigent presque partout une alcoolémie zéro (et souvent zéro drogue). C’est plus strict que l’infraction criminelle à 0,08. « Zéro » veut dire rien, pas « sous 0,05 ».',
    topic: 'Facultés affaiblies',
  ),
  'alc-drugs': FrQuestion(
    prompt: 'La loi sur les facultés affaiblies couvre :',
    choices: [
      'L’alcool seulement',
      'L’alcool, les drogues (y compris le cannabis et certains médicaments) et leurs combinaisons',
      'Seulement les drogues illégales, pas le cannabis ni les ordonnances',
      'Seulement si vous vous sentez ivre',
    ],
    explanation: 'Vous ne devez pas conduire avec les facultés affaiblies par l’alcool, le cannabis, d’autres drogues ou un mélange. Certains médicaments d’ordonnance ou en vente libre affaiblissent aussi. Si l’étiquette ou le médecin déconseille de conduire, ne conduisez pas.',
    topic: 'Facultés affaiblies',
  ),
  'alc-fatigue': FrQuestion(
    prompt: 'Conduire très fatigué est dangereux parce que :',
    choices: [
      'La fatigue est inconfortable mais n’affecte pas le temps de réaction',
      'La fatigue peut ralentir les réactions et causer des micro-sommeils, un risque comparable à l’affaiblissement',
      'C’est seulement un problème sur l’autoroute la nuit',
      'Le café élimine toujours le risque',
    ],
    explanation: 'Les guides traitent la fatigue comme un affaiblissement grave. La bonne réponse est de s’arrêter et de se reposer, pas de « pousser ». La caféine ne remplace pas le sommeil.',
    topic: 'Facultés affaiblies',
  ),
  'alc-plan': FrQuestion(
    prompt: 'Un plan responsable si vous allez boire est :',
    choices: [
      'Conduire lentement sur des routes secondaires',
      'Un conducteur qui ne boit pas, taxi, transport en commun, ou rester dormir — ne pas conduire',
      'Manger un gros repas pour conduire après deux verres',
      'Attendre 15 minutes après le dernier verre',
    ],
    explanation: 'Il n’y a pas de méthode maison fiable pour calculer l’alcoolémie. Si vous buvez, vous n’êtes pas le conducteur. Les conducteurs GDL ne doivent avoir aucun alcool dans l’organisme.',
    topic: 'Facultés affaiblies',
  ),
  'alc-refuse': FrQuestion(
    prompt: 'Refuser une demande légale d’échantillon d’haleine ou de dépistage de drogue par la police :',
    choices: [
      'N’a aucune conséquence si vous n’étiez pas réellement affaibli',
      'Peut entraîner des accusations graves et des conséquences pour le permis, à elles seules',
      'Est un droit sans aucune sanction',
      'Est permis si vous étiez seulement à vélo',
    ],
    explanation: 'Le droit canadien traite le refus de se conformer à une demande légale de test comme une infraction grave, distincte du résultat d’alcoolémie. Ne prenez pas de conseil juridique auprès d’une appli d’étude.',
    topic: 'Facultés affaiblies',
  ),
  'alc-open': FrQuestion(
    prompt: 'L’alcool ouvert dans l’habitacle pendant que vous conduisez est :',
    choices: [
      'Correct si seuls les passagers boivent',
      'Généralement interdit; l’alcool devrait être fermé et souvent hors de portée, selon les lois locales',
      'Permis après 21 h',
      'Permis seulement sur les routes rurales',
    ],
    explanation: 'Les provinces et territoires restreignent l’alcool ouvert dans un véhicule. Ne conduisez pas avec un verre ouvert et ne laissez pas les passagers boire dans l’auto. Vérifiez les règles exactes là où vous vivez.',
    topic: 'Facultés affaiblies',
  ),
  'alc-morning': FrQuestion(
    prompt: 'L’alcool de la veille :',
    choices: [
      'Est toujours parti après huit heures de sommeil',
      'Peut encore être dans le sang le matin — vous pourriez encore dépasser une limite légale ou GDL',
      'N’a d’effet que si vous avez mal à la tête',
      'Ne compte pas si vous buvez de l’eau',
    ],
    explanation: 'Le corps a besoin de temps pour métaboliser l’alcool. Conduire le matin après une soirée chargée peut encore être illégal, surtout avec un permis GDL à tolérance zéro.',
    topic: 'Facultés affaiblies',
  ),
  'win-black-ice': FrQuestion(
    prompt: 'La glace noire est dangereuse parce que :',
    choices: [
      'Elle se voit facilement comme une nappe blanche',
      'C’est une mince couche souvent presque invisible, surtout sur les ponts et viaducs',
      'Elle ne se forme que sous −20 °C',
      'Les pneus d’hiver la rendent sans importance',
    ],
    explanation: 'Les ponts et viaducs gèlent en premier. Si la direction paraît légère ou la chaussée luisante, relâchez l’accélérateur et évitez les mouvements brusques. Les pneus d’hiver aident mais ne rendent pas la glace sûre.',
    topic: 'Hiver',
  ),
  'win-distance': FrQuestion(
    prompt: 'Dans la neige ou sur la glace, vous devez :',
    choices: [
      'Suivre plus près pour vous servir du véhicule de tête comme coupe-vent',
      'Augmenter nettement la distance de suivi et ralentir',
      'Utiliser le régulateur de vitesse pour tenir une allure stable',
      'Garder la même distance qu’en été',
    ],
    explanation: 'Les distances d’arrêt croissent vite sur neige et glace. Laissez un bien plus grand écart. Le régulateur est une mauvaise idée sur chaussée glissante, car le véhicule peut accélérer sans prévenir.',
    topic: 'Hiver',
  ),
  'win-clear': FrQuestion(
    prompt: 'Avant de conduire en hiver, vous devez :',
    choices: [
      'Dégager un petit judas dans le givre',
      'Dégager toutes les vitres, rétros, feux et le toit de neige et de glace',
      'Chauffer seulement l’habitacle; la neige s’envolera',
      'Laisser la neige sur le toit pour isoler',
    ],
    explanation: 'Des plaques de neige qui glissent du toit peuvent vous aveugler ou aveugler le conducteur derrière. Des feux givrés cachent vos feux de freinage. Prenez le temps de tout dégager. Plusieurs endroits peuvent vous donner un constat.',
    topic: 'Hiver',
  ),
  'win-skid': FrQuestion(
    prompt: 'Si l’arrière du véhicule se met à déraper, une reprise courante est de :',
    choices: [
      'Frapper les freins et braquer fort dans l’autre sens',
      'Relâcher l’accélérateur et braquer dans la direction où vous voulez que l’avant aille (dans le dérapage)',
      'Tourner le volant à fond à gauche et le tenir',
      'Mettre le véhicule en marche arrière',
    ],
    explanation: 'Regardez et braquez où vous voulez aller, relâchez la gaz, évitez le freinage de panique. L’ABS (s’il est présent) permet de freiner en dirigeant — pression ferme et stable. Pratiquez seulement dans un endroit sûr et légal.',
    topic: 'Hiver',
  ),
  'win-headlights': FrQuestion(
    prompt: 'Dans une neige, une pluie ou un brouillard denses, vous devez :',
    choices: [
      'Utiliser les feux de route pour percer',
      'Utiliser les feux de croisement pour voir et être vu sans éblouir',
      'Rouler seulement avec les feux de stationnement',
      'Éteindre tous les feux pour réduire la réflexion',
    ],
    explanation: 'Les feux de croisement sont le choix habituel dans la neige et le brouillard. Les feux de route se réfléchissent dans vos yeux. Assurez-vous que les feux arrière sont allumés.',
    topic: 'Hiver',
  ),
  'win-tires-qc': FrQuestion(
    prompt: 'Au Québec, les véhicules de tourisme doivent généralement porter des pneus d’hiver :',
    choices: [
      'Du 1er décembre au 15 mars, sauf exception',
      'Seulement en région rurale',
      'Jamais — les pneus quatre saisons suffisent toujours',
      'Seulement si vous êtes en permis progressif',
    ],
    explanation: 'La SAAQ exige des pneus d’hiver sur les véhicules de tourisme et les taxis du 1er décembre au 15 mars (sauf exception du règlement). D’autres provinces les recommandent; certaines ont des règles de montagne différentes. Vérifiez la page officielle pour l’année.',
    topic: 'Hiver',
    sourceNote: 'Item d’étude non officiel pointant vers les dates SAAQ des pneus d’hiver.',
  ),
  'win-kit': FrQuestion(
    prompt:
        'Une trousse d’urgence d’hiver est surtout utile si elle contient :',
    choices: [
      'Seulement un chargeur de téléphone',
      'Des articles comme une couverture, une pelle, un grattoir, une lampe, des câbles et des vêtements chauds',
      'Un second jeu de pneus d’été',
      'Seulement des fusées',
    ],
    explanation: 'Les guides recommandent une trousse en cas de panne ou de tempête. Restez dans le véhicule si vous êtes coincé dans un blizzard, sauf si de l’aide est clairement à distance de marche sûre.',
    topic: 'Hiver',
  ),
  'win-hills': FrQuestion(
    prompt: 'Sur une côte glacée, vous devez :',
    choices: [
      'Prendre de l’élan et espérer que l’inertie vous porte',
      'Utiliser un rapport bas, aller lentement, et éviter de vous arrêter à mi-pente si possible',
      'Tenir les freins tout le long en descente, au neutre',
      'Dépasser les plus lents sur l’accotement',
    ],
    explanation: 'Des mouvements lents et doux battent les trucs d’élan. Le neutre en descente réduit le contrôle. Laissez plus d’espace pour ne pas être forcé de vous arrêter dans la pente.',
    topic: 'Hiver',
  ),
  'on-400': FrQuestion(
    prompt:
        'En Ontario, un conducteur G1 ne peut généralement pas conduire sur :',
    choices: [
      'Toute route dont la limite dépasse 50 km/h',
      'Les autoroutes de la série 400 et certaines voies rapides nommées, sauf si l’accompagnateur est un instructeur certifié',
      'Les rues résidentielles après 15 h',
      'Les routes hors de sa municipalité',
    ],
    explanation: 'Les règles G1 de l’Ontario interdisent les autoroutes de la série 400 et des voies rapides listées (QEW, Gardiner, Don Valley Parkway, et autres) sauf si l’accompagnateur est un instructeur certifié. Confirmez la liste actuelle sur ontario.ca.',
    topic: 'Règles',
    sourceNote:
        'Item d’étude non officiel basé sur les restrictions G1 de l’Ontario.',
  ),
  'bc-l-sign': FrQuestion(
    prompt: 'En Colombie-Britannique, un apprenti de classe 7 doit :',
    choices: [
      'Afficher un panneau L et conduire avec un superviseur qualifié',
      'Conduire seul après deux semaines',
      'Utiliser seulement les voies réservées',
      'Transporter un carnet papier au lieu d’une carte de permis',
    ],
    explanation: 'Le GLP d’ICBC exige un panneau L, un superviseur qualifié, alcool/drogue à zéro, et d’autres limites d’apprenti. Réussir l’examen de connaissances ne permet pas de conduire tant que le permis n’est pas délivré.',
    topic: 'Règles',
    sourceNote: 'Item d’étude non officiel basé sur le permis progressif ICBC.',
  ),
  'sign-no-left': FrQuestion(
    prompt: 'Que signifie ce panneau?',
    choices: [
      'Les virages à gauche sont recommandés',
      'Interdiction de tourner à gauche',
      'Tenez la gauche',
      'Sens unique vers la gauche',
    ],
    explanation: 'L’anneau rouge et la barre sur une flèche gauche interdisent ce virage. Continuez seulement dans une direction permise.',
    topic: 'Panneaux',
  ),
  'sign-slippery': FrQuestion(
    prompt: 'Contre quoi ce panneau vous prévient-il?',
    choices: [
      'La prochaine sortie est fermée',
      'La chaussée peut être glissante — relâchez et évitez les à-coups',
      'Les camions doivent rétrograder',
      'Un traversier',
    ],
    explanation: 'Ce danger signifie que la surface peut être glissante. Ralentissez avant le risque, pas au milieu d’un dérapage, et augmentez l’intervalle.',
    topic: 'Panneaux',
  ),
  'sign-pedestrian': FrQuestion(
    prompt: 'Que signifie ce panneau?',
    choices: [
      'Une limite de 20 km/h pour terrain de jeu commence ici',
      'Des piétons peuvent traverser — cédez et soyez prêt à arrêter',
      'Piétons interdits sur cette route',
      'Stationnement réservé aux marcheurs',
    ],
    explanation: 'Ce danger marque une traverse ou une zone piétonne. Ralentissez, balayez les trottoirs, et arrêtez si quelqu’un traverse ou s’apprête à le faire.',
    topic: 'Panneaux',
  ),
  'sign-roundabout': FrQuestion(
    prompt: 'Que signifie ce panneau?',
    choices: [
      'Un carrefour giratoire plus loin — cédez à qui est déjà dans l’anneau',
      'Les demi-tours sont obligatoires',
      'La route est fermée à droite',
      'Une boucle de stationnement',
    ],
    explanation: 'Ralentissez à l’approche, cédez aux véhicules déjà dans le giratoire, et prenez la voie indiquée pour votre sortie. Ne vous arrêtez pas dans l’anneau sans raison.',
    topic: 'Panneaux',
  ),
  'sign-no-u-turn': FrQuestion(
    prompt: 'Que signifie ce panneau?',
    choices: [
      'Les demi-tours sont encouragés',
      'Demi-tour interdit',
      'Giratoire plus loin',
      'Sens unique',
    ],
    explanation: 'La barre sur la flèche de demi-tour interdit ce mouvement ici. Faites demi-tour seulement où c’est légal et sûr.',
    topic: 'Panneaux',
  ),
  'sign-one-way': FrQuestion(
    prompt: 'Que signifie ce panneau?',
    choices: [
      'La circulation sur cette voie va seulement dans le sens de la flèche',
      'La circulation à double sens commence',
      'Le dépassement est obligatoire',
      'Cul-de-sac',
    ],
    explanation: 'Un panneau de sens unique indique la seule direction permise. N’entrez pas à contre-sens; cherchez l’entrée interdite à l’autre bout.',
    topic: 'Panneaux',
  ),
  'sign-arret': FrQuestion(
    prompt: 'Que signifie ce panneau?',
    choices: [
      'Ralentir pour un poste d’inspection du Québec',
      'Immobilisation complète, puis partir seulement lorsque c’est sûr',
      'Céder seulement aux autobus',
      'Stationnement réservé aux taxis',
    ],
    explanation: 'ARRÊT est le mot français sur beaucoup de panneaux d’arrêt au Québec. L’action est la même que STOP : arrêt complet, puis départ à votre tour.',
    topic: 'Panneaux',
    sourceNote:
        'Item d’étude non officiel basé sur le libellé des arrêts au Québec.',
  ),
  'gdl-zero': FrQuestion(
    prompt: 'Pendant une étape typique du permis progressif, la norme d’alcool attendue est :',
    choices: [
      'La même limite criminelle qu’un permis complet',
      'Zéro — même une petite quantité peut vous faire perdre le permis',
      'Un verre standard si vous attendez une heure',
      'Permis si un superviseur est dans le véhicule',
    ],
    explanation: 'Les apprentis et intermédiaires sont généralement tenus au zéro alcool (et règles semblables pour les drogues), plus strict que le seuil du Code criminel pour un permis complet. Confirmez votre étape dans le guide officiel.',
    topic: 'Permis progressif',
  ),
  'gdl-supervisor': FrQuestion(
    prompt: 'À l’étape d’apprenti, vous devez généralement :',
    choices: [
      'Conduire seulement sur un terrain privé',
      'Être accompagné d’un conducteur pleinement titulaire qui satisfait aux règles locales',
      'Conduire seul après le coucher du soleil pour pratiquer la nuit',
      'Sauter l’examen de connaissances si vous avez plus de 19 ans',
    ],
    explanation: 'L’apprenti est supervisé. Qui est admissible (années de permis, pas un conducteur GDL, à l’avant) est fixé par chaque province ou territoire. La conduite solo vient plus tard, après un examen pratique dans la plupart des programmes.',
    topic: 'Permis progressif',
  ),
  'gdl-knowledge-first': FrQuestion(
    prompt: 'Avant de conduire sur la voie publique comme nouvel apprenti, vous devez typiquement :',
    choices: [
      'Réussir l’examen de connaissances (et souvent la vision) et détenir le permis d’apprenti',
      'Réussir d’abord l’examen pratique, puis étudier les panneaux',
      'Acheter l’assurance seulement après six mois',
      'Terminer un diplôme universitaire de conduite',
    ],
    explanation: 'L’examen de connaissances vient en premier. Réussir cette appli n’est pas cet examen. Le test de vision a souvent lieu le même jour. Il faut encore le permis d’apprenti délivré avant de conduire.',
    topic: 'Permis progressif',
  ),
  'sign-cedez': FrQuestion(
    prompt: 'Que signifie ce panneau?',
    choices: [
      'Arrêt, puis continuer comme au feu vert',
      'Céder le passage',
      'Stationnement réservé aux taxis',
      'Entrée interdite',
    ],
    explanation: 'CÉDEZ est le libellé français de nombreux panneaux de cédez au Québec. Ralentir, être prêt à s’arrêter, et laisser passer ceux qui ont priorité.',
    topic: 'Panneaux',
  ),
  'sign-curve-slow': FrQuestion(
    prompt: 'Quand vous voyez cet avertissement, vous devez :',
    choices: [
      'Garder la vitesse d’autoroute; le panneau est seulement indicatif',
      'Ralentir avant la courbe et rester dans votre voie',
      'Vous arrêter dans la voie et attendre',
      'Dépasser sur l’accotement',
    ],
    explanation: 'Un losange jaune qui annonce une courbe n’est ni un arrêt ni une nouvelle limite. Réduisez la vitesse avant le virage et tenez votre voie.',
    topic: 'Panneaux',
  ),
  'sign-rail-gates': FrQuestion(
    prompt: 'À un passage à niveau avec barrières ou feux, vous devez :',
    choices: [
      'Contourner les barrières baissées s’il n’y a pas de train visible',
      'Vous arrêter seulement pour un train de marchandises',
      'Ne jamais traverser pendant que les feux clignotent ou que les barrières sont baissées; regarder et écouter même si elles sont levées',
      'Accélérer pour quitter les rails plus vite',
    ],
    explanation: 'Ne contournez jamais une barrière baissée. Si les feux clignotent, arrêtez-vous. Même barrières levées, regardez et écoutez — un second train peut suivre.',
    topic: 'Panneaux',
  ),
  'rules-pass-solid': FrQuestion(
    prompt: 'Une ligne jaune continue de votre côté signifie généralement :',
    choices: [
      'Vous pouvez dépasser si le véhicule devant est lent',
      'Ne pas dépasser; rester dans votre voie',
      'Voie réservée aux autobus',
      'Le stationnement est permis à gauche',
    ],
    explanation: 'Une ligne jaune continue de votre côté interdit le dépassement. Une ligne discontinue le permet si la voie est libre. Lisez toujours le marquage avec les panneaux et la circulation.',
    topic: 'Règles',
  ),
  'rules-lane-change': FrQuestion(
    prompt: 'Avant de changer de voie, vous devez :',
    choices: [
      'Signaler, vérifier les rétroviseurs et l’angle mort, puis vous déporter si c’est libre',
      'Vous déporter d’abord, puis signaler',
      'Klaxonner et serrer sans regarder',
      'Vous fier seulement à une caméra de recul',
    ],
    explanation: 'Signalez tôt, vérifiez les rétroviseurs, puis jetez un coup d’œil par-dessus l’épaule. Ne bougez que si l’espace est sûr. Les miroirs seuls ratent les véhicules à côté.',
    topic: 'Règles',
  ),
  'rules-headlights-day': FrQuestion(
    prompt: 'Quand faut-il utiliser les phares (ou les feux de jour) ?',
    choices: [
      'Seulement après le crépuscule civil',
      'Dès que la visibilité est mauvaise, et souvent dès que le véhicule roule',
      'Jamais sous la pluie, car cela draine la batterie',
      'Seulement sur autoroute',
    ],
    explanation: 'Utilisez les feux pour qu’on vous voie sous la pluie, la neige, le brouillard et au crépuscule. Beaucoup de véhicules ont des feux de jour; allumez quand même les phares quand il fait sombre.',
    topic: 'Règles',
  ),
  'rules-park-hill': FrQuestion(
    prompt: 'En stationnant en montée le long d’une bordure, une méthode courante est :',
    choices: [
      'Roues droites et boîte au point mort',
      'Braquer les roues pour qu’un roulement s’éloigne de la circulation (souvent vers la bordure)',
      'Braquer vers la voie pour partir plus vite',
      'Serrer seulement le frein de stationnement',
    ],
    explanation: 'En montée avec bordure, on braque souvent vers la chaussée pour que le véhicule s’appuie sur la bordure. En descente, vers la bordure. Serrez toujours le frein de stationnement.',
    topic: 'Règles',
  ),
  'rules-horn': FrQuestion(
    prompt: 'Le klaxon sert à :',
    choices: [
      'Avertir d’un danger, pas à gronder ni à presser',
      'Être utilisé à chaque feu vert',
      'Remplacer le clignotant au changement de voie',
      'Être actionné en zone d’hôpital pour dégager la route',
    ],
    explanation: 'Le klaxon avertit, il n’exprime pas la colère. Le bruit inutile est souvent une infraction. Le clignotant reste obligatoire pour un changement de voie.',
    topic: 'Règles',
  ),
  'gdl-display-sign': FrQuestion(
    prompt: 'Là où un apprenti ou un novice doit afficher un L ou un N, ce panneau :',
    choices: [
      'Est facultatif si vous avez réussi le quiz de cette appli',
      'Doit être affiché comme l’exige l’autorité, généralement sur le véhicule',
      'Peut être un fond d’écran de téléphone',
      'Ne concerne que les motos',
    ],
    explanation: 'La Colombie-Britannique et d’autres programmes exigent un L ou un N visible. Les règles changent selon la province. Un quiz d’étude ne remplace pas l’exigence officielle.',
    topic: 'Permis progressif',
  ),
  'gdl-time-varies': FrQuestion(
    prompt: 'Le temps minimum en étape d’apprenti ou de novice :',
    choices: [
      'Est de 12 mois partout au Canada',
      'Est fixé par chaque province ou territoire et peut être plus court avec une formation approuvée — lisez la page officielle',
      'Peut être sauté si vous avez plus de 25 ans, partout',
      'N’est publié nulle part',
    ],
    explanation: 'L’Ontario, le Québec, la C.-B. et d’autres publient des délais différents (et parfois une réduction après une formation). Le Nunavut ne publie pas d’horaire GDL pluriannuel. N’apprenez pas un chiffre national unique.',
    topic: 'Permis progressif',
  ),
  'gdl-night': FrQuestion(
    prompt: 'La conduite de nuit à l’étape d’apprenti :',
    choices: [
      'Est libre dès que vous avez la carte',
      'Est souvent limitée à certaines heures, sauf accompagnateur admissible — confirmez la page GDL locale',
      'Est interdite jusqu’au permis complet',
      'N’est permise que sur un terrain privé',
    ],
    explanation: 'Plusieurs permis d’apprenti interdisent la conduite tardive (par exemple G1 en Ontario, minuit–5 h). Les heures et exceptions sont provinciales.',
    topic: 'Permis progressif',
  ),
  'gdl-passengers': FrQuestion(
    prompt: 'Les limites de passagers en permis progressif :',
    choices: [
      'Ne s’appliquent jamais si les ceintures sont bouclées',
      'Plafonnent souvent le nombre de personnes, surtout la nuit ou sous un certain âge — vérifiez l’étape officielle',
      'Ne concernent que les classes commerciales',
      'Sont identiques dans chaque province',
    ],
    explanation: 'Les étapes novice et parfois apprenti limitent les passagers (N en C.-B., G2 de 19 ans ou moins la nuit en Ontario, etc.). Des exceptions familiales existent. Confirmez la page de votre permis.',
    topic: 'Permis progressif',
  ),
  'alc-cannabis': FrQuestion(
    prompt: 'Le cannabis et la conduite au Canada :',
    choices: [
      'Est légal pour tout conducteur titulaire si vous attendez dix minutes',
      'Peut diminuer les facultés, est une question pénale et de permis, et le GDL exige généralement zéro',
      'N’est un problème que si vous avez aussi bu',
      'N’affecte pas le temps de réaction',
    ],
    explanation: 'La conduite avec facultés affaiblies par la drogue est une infraction au Code criminel. Les étapes GDL exigent généralement une concentration nulle de drogue comme d’alcool.',
    topic: 'Facultés affaiblies',
  ),
  'alc-prescription': FrQuestion(
    prompt: 'Un médicament sur ordonnance ou en vente libre qui cause de la somnolence :',
    choices: [
      'Est toujours sûr parce qu’un médecin l’a prescrit',
      'Peut quand même diminuer les facultés; lisez l’étiquette et ne conduisez pas si vous n’êtes pas alerte',
      'Ne concerne que les permis commerciaux',
      'Est permis si vous restez dans la voie de droite',
    ],
    explanation: 'Un médicament légal peut quand même diminuer les facultés. Si l’étiquette déconseille de manœuvrer une machine, ne conduisez pas.',
    topic: 'Facultés affaiblies',
  ),
  'win-visibility': FrQuestion(
    prompt: 'Si la poudrerie ou le brouillard réduit ce que vous voyez, vous devez :',
    choices: [
      'Garder la vitesse d’autoroute pour ne pas surprendre derrière',
      'Ralentir, allumer les phares, et laisser un intervalle suffisant pour vous arrêter',
      'N’utiliser que les feux de stationnement',
      'Coller au véhicule devant',
    ],
    explanation: 'Roulez de façon à pouvoir vous arrêter dans la distance visible. Les phares (pas les feux de route dans le brouillard) aident les autres à vous voir.',
    topic: 'Hiver',
  ),
  'win-stuck': FrQuestion(
    prompt: 'Si vous êtes coincé dans un blizzard loin de l’aide, une recommandation courante est :',
    choices: [
      'Quitter le véhicule et marcher vers le dernier village',
      'Rester dans le véhicule, laisser une vitre légèrement ouverte, et faire tourner le moteur seulement pour la chaleur',
      'Dormir dans un banc de neige à côté',
      'Boire de l’alcool pour se réchauffer',
    ],
    explanation: 'Le véhicule est un abri plus facile à trouver. Dégagez le tuyau d’échappement pour éviter le monoxyde de carbone. Marchez seulement si l’aide est clairement proche.',
    topic: 'Hiver',
  ),
};

const Map<String, (String, String)> quizMetaFr = {
  'signs': ('Panneaux et feux', 'Arrêt, cédez, feux et marquage'),
  'sign-identify': (
    'Que signifie ce panneau?',
    'Regardez le dessin, puis choisissez le sens',
  ),
  'rules': ('Règles de la route', 'Priorité, partage de la route et espace'),
  'impairment': (
    'Alcool, drogues et fatigue',
    'Limites criminelles, zéro GDL, et planification',
  ),
  'winter': ('Conduite d’hiver', 'Glace, neige, pneus et visibilité'),
  'gdl': (
    'Permis progressif',
    'Supervision, zéro alcool, et connaissances puis route',
  ),
  'mixed': (
    'Pratique mixte (30)',
    'Une séance de 30 questions tirées de tous les sujets',
  ),
};

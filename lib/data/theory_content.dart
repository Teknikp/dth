import '../models/theory.dart';

const signsTopic = TheoryTopic(
  id: 'signs',
  title: Copy('Signs and signals', 'Panneaux et feux'),
  subtitle: Copy(
    'Shapes first, then what each one requires',
    'D’abord les formes, puis ce que chacune exige',
  ),
  lead: Copy(
    'Canadian knowledge tests expect you to read a sign by shape and colour, then say what you must do. These drawings are original study aids, not official plates. Confirm details in your provincial or territorial handbook.',
    'Les examens de connaissances demandent de lire un panneau par sa forme et sa couleur, puis de dire ce qu’il faut faire. Ces dessins sont des aides d’étude originales, pas des plaques officielles. Confirmez les détails dans le guide de votre province ou territoire.',
  ),
  sections: [
    TheorySection(
      heading: Copy(
        'How signs are grouped',
        'Comment les panneaux sont groupés',
      ),
      body: Copy(
        'Handbooks group traffic control into a few families. Regulatory signs tell you a rule you must follow (stop, speed, turn bans). Warning signs tell you to prepare for a hazard or a change in the road. Signals and pavement markings work with signs; they can also stand alone. Information signs (hospital, parking, route markers) guide you but are not the main knowledge-test focus.',
        'Les guides regroupent la signalisation en quelques familles. Les panneaux de prescription donnent une règle à suivre (arrêt, vitesse, interdiction de tourner). Les panneaux de danger vous demandent de vous préparer à un risque ou à un changement. Les feux et le marquage travaillent avec les panneaux; ils peuvent aussi suffire seuls. Les panneaux d’indication (hôpital, stationnement, itinéraire) orientent, mais ce n’est pas le cœur de l’examen.',
      ),
      signIds: ['stop', 'warning_curve', 'maximum_50'],
    ),
    TheorySection(
      heading: Copy('Regulatory: you must obey', 'Prescription : à respecter'),
      body: Copy(
        'A red octagon means stop: full stop before the line or crosswalk, then go only when it is your turn and safe. An inverted red-and-white triangle means yield: slow, be ready to stop, and give way. A red circle with a white bar means do not enter. A white rectangle with MAXIMUM and a number is a posted speed limit. A red ring around a black arrow with a slash forbids that movement (no left turn, no U-turn).',
        'Un octogone rouge signifie arrêt : immobilisation complète avant la ligne ou le passage, puis départ seulement à votre tour et en sécurité. Un triangle inversé rouge et blanc signifie cédez : ralentir, être prêt à s’arrêter, et laisser passer. Un cercle rouge avec une barre blanche signifie entrée interdite. Un rectangle blanc avec MAXIMUM et un chiffre est une limite affichée. Un anneau rouge autour d’une flèche barrée interdit ce mouvement (pas à gauche, pas de demi-tour).',
      ),
      signIds: ['stop', 'yield', 'do_not_enter', 'maximum_50', 'no_left_turn'],
    ),
    TheorySection(
      heading: Copy('Warnings, school, and rail', 'Dangers, école et rail'),
      body: Copy(
        'Yellow diamonds warn of curves, merges, ice, pedestrians, and similar hazards. A fluorescent yellow-green pentagon marks a school area or school crossing — watch for children; a separate sign may post a school-zone speed. An X-shaped crossbuck marks a railway crossing: look, listen, and never go around lowered gates. These signs do not replace a stop or a speed limit; they tell you to prepare.',
        'Les losanges jaunes préviennent des courbes, des concourances, de la glace, des piétons et d’autres risques. Un pentagone jaune-vert fluorescent marque une zone ou une traverse scolaire — surveillez les enfants; une limite scolaire peut être affichée à part. Un X marque un passage à niveau : regarder, écouter, et ne jamais contourner une barrière baissée. Ces panneaux ne remplacent pas un arrêt ou une limite; ils demandent de se préparer.',
      ),
      signIds: ['school', 'railway', 'slippery', 'pedestrian', 'roundabout'],
    ),
    TheorySection(
      heading: Copy('Lights and pavement', 'Feux et marquage'),
      body: Copy(
        'A flashing red signal is treated like a stop sign. A flashing yellow means proceed with caution; you still yield to anyone with the right-of-way. A solid yellow line on your side of the centre line generally means do not pass. Broken yellow usually allows passing if the way is clear. Always read the marking together with signs and oncoming traffic.',
        'Un feu rouge clignotant se traite comme un arrêt. Un jaune clignotant permet de continuer avec prudence; vous cédez toujours à qui a priorité. Une ligne jaune continue de votre côté interdit généralement le dépassement. Une ligne discontinue le permet si la voie est libre. Lisez toujours le marquage avec les panneaux et la circulation.',
      ),
      signIds: ['signal_flash_red', 'signal_flash_yellow', 'pavement_yellow'],
    ),
  ],
  quizIds: ['signs', 'sign-identify'],
  provincialNotes: [
    ProvincialNote(
      appliesTo: ['QC'],
      heading: Copy('Québec stop worded ARRÊT', 'Québec : panneau ARRÊT'),
      body: Copy(
        'In Québec the octagon often reads ARRÊT instead of STOP. The required action is the same: a complete stop. Yield signs may read CÉDEZ. Confirm current plates in the SAAQ guide.',
        'Au Québec, l’octogone porte souvent ARRÊT plutôt que STOP. L’action exigée est la même : un arrêt complet. Le cédez peut porter CÉDEZ. Confirmez les plaques actuelles dans le guide de la SAAQ.',
      ),
      signIds: ['arret', 'cedez'],
    ),
  ],
);

const rulesTopic = TheoryTopic(
  id: 'rules',
  title: Copy('Rules of the road', 'Règles de la route'),
  subtitle: Copy(
    'Right-of-way, sharing space, and where provinces differ',
    'Priorité, partage de l’espace, et différences provinciales',
  ),
  lead: Copy(
    'Most right-of-way ideas are shared across Canada. A few rules — freeway bans for learners, winter tires, right-turn-on-red — are provincial. Use the selector on the Theory tab, then confirm the official handbook for that place.',
    'La plupart des règles de priorité sont partagées au Canada. Quelques-unes — interdiction d’autoroute pour les apprentis, pneus d’hiver, virage à droite au rouge — sont provinciales. Utilisez le sélecteur de l’onglet Théorie, puis confirmez le guide officiel de cet endroit.',
  ),
  sections: [
    TheorySection(
      heading: Copy('Right-of-way basics', 'Bases de la priorité'),
      body: Copy(
        'At a four-way stop, the first vehicle to stop goes first; if you arrive together, yield to the right. In a roundabout, yield to traffic already in the circle and use the indicated lane. Pedestrians in a marked or unmarked crosswalk you are approaching generally have priority once they are crossing or clearly waiting with the right to cross — handbooks still tell you to stop and let them finish. Never assume the other driver will give way.',
        'À un arrêt quatre voies, le premier arrivé part le premier; si vous arrivez ensemble, cédez à droite. Dans un giratoire, cédez à qui est déjà dans l’anneau et prenez la voie indiquée. Les piétons dans un passage, marqué ou non, ont généralement priorité une fois qu’ils traversent ou qu’ils s’apprêtent clairement à le faire — les guides demandent quand même de les laisser terminer. Ne supposez jamais que l’autre va céder.',
      ),
      signIds: ['stop', 'roundabout', 'pedestrian'],
    ),
    TheorySection(
      heading: Copy('Sharing the road', 'Partager la route'),
      body: Copy(
        'When a school bus shows flashing red lights and a stop arm on an undivided road, traffic in both directions stops until the arm is in and the lights stop. Leave extra room for cyclists and motorcycles; check the blind spot before you move over. Emergency vehicles with lights and siren: signal, pull as far right as you safely can, and stop. Many places also require you to slow and move over for stopped emergency or tow vehicles.',
        'Quand un autobus scolaire a les feux rouges et le bras d’arrêt sur une route non divisée, les deux sens s’arrêtent jusqu’à ce que le bras rentre et que les feux cessent. Laissez de l’espace aux cyclistes et motos; vérifiez l’angle mort avant de vous déporter. Véhicule d’urgence sirène et gyrophares : signalez, serrez à droite autant que c’est sûr, et arrêtez. Plusieurs endroits exigent aussi de ralentir et de changer de voie pour un véhicule d’urgence ou de dépannage arrêté.',
      ),
    ),
    TheorySection(
      heading: Copy(
        'Space, belts, and turning',
        'Espace, ceintures et virages',
      ),
      body: Copy(
        'Seatbelts are required in every province and territory when they are fitted; drivers are typically responsible for young passengers. Leave a following gap you could stop in — longer in rain or ice. A steady red light means stop; a right turn on red is allowed in many places after a full stop unless a sign forbids it, but some cities and Québec intersections prohibit it. Always read the sign at that corner.',
        'La ceinture est obligatoire partout au Canada lorsqu’elle est installée; le conducteur est généralement responsable des jeunes passagers. Gardez un intervalle suffisant pour vous arrêter — plus long sous la pluie ou la glace. Un rouge fixe signifie arrêt; le virage à droite au rouge est souvent permis après un arrêt complet, sauf panneau contraire, mais certaines villes et intersections du Québec l’interdisent. Lisez toujours le panneau du coin.',
      ),
      signIds: ['no_left_turn', 'one_way'],
    ),
  ],
  quizIds: ['rules'],
  provincialNotes: [
    ProvincialNote(
      appliesTo: ['ON'],
      heading: Copy(
        'Ontario G1 freeway limit',
        'Ontario : limite G1 sur autoroute',
      ),
      body: Copy(
        'A G1 driver generally may not use 400-series highways and some named expressways unless the accompanying driver is a licensed driving instructor. Confirm the current list on ontario.ca — do not treat a study app as the list.',
        'Un conducteur G1 ne peut généralement pas utiliser les autoroutes de la série 400 et certaines voies rapides nommées, sauf si l’accompagnateur est un instructeur certifié. Confirmez la liste actuelle sur ontario.ca — une appli d’étude n’est pas la liste.',
      ),
    ),
    ProvincialNote(
      appliesTo: ['BC'],
      heading: Copy('B.C. L display', 'C.-B. : panneau L'),
      body: Copy(
        'A Class 7 learner in British Columbia must display an L sign and drive with a qualified supervisor, among other GLP limits. Passing the knowledge test does not by itself authorise solo driving.',
        'Un apprenti de classe 7 en Colombie-Britannique doit afficher un panneau L et conduire avec un superviseur qualifié, parmi d’autres limites du GLP. Réussir l’examen de connaissances n’autorise pas à conduire seul.',
      ),
    ),
    ProvincialNote(
      appliesTo: ['QC'],
      heading: Copy('Québec right-on-red', 'Québec : droite au rouge'),
      body: Copy(
        'Right turn on red is more restricted in Québec than in much of Canada, and it is prohibited on the Island of Montréal unless a sign allows it. Always follow the sign at that signal. Confirm in the SAAQ guide.',
        'Le virage à droite au rouge est plus encadré au Québec que dans une grande partie du Canada, et il est interdit sur l’île de Montréal sauf panneau qui le permet. Suivez toujours le panneau à ce feu. Confirmez dans le guide de la SAAQ.',
      ),
    ),
  ],
);

const impairmentTopic = TheoryTopic(
  id: 'impairment',
  title: Copy('Alcohol, drugs, and fatigue', 'Alcool, drogues et fatigue'),
  subtitle: Copy(
    'Criminal limits, GDL zero, and planning a ride home',
    'Limites criminelles, zéro GDL, et planifier le retour',
  ),
  lead: Copy(
    'Impairment is a core knowledge-test topic everywhere in Canada. Graduated-licence drivers are held to a stricter standard than fully licensed drivers. This is unofficial study, not legal advice.',
    'L’aptitude à conduire est un sujet d’examen partout au Canada. Les conducteurs en permis progressif sont soumis à une norme plus stricte que les titulaires d’un permis complet. Ceci est une étude non officielle, pas un avis juridique.',
  ),
  sections: [
    TheorySection(
      heading: Copy(
        'Criminal limits vs GDL zero',
        'Limites criminelles et zéro GDL',
      ),
      body: Copy(
        'Canada’s Criminal Code sets national offences for alcohol and drug impairment, including refusing a lawful test. Provinces add licence suspensions and administrative penalties. If you are in a graduated licence stage (learner or intermediate), the expected blood-alcohol and drug standard is typically zero — even an amount that would be legal for a fully licensed driver can cost you the licence. Read your handbook’s GDL chapter, not a rumour about “one drink”.',
        'Le Code criminel fixe des infractions nationales pour l’alcool et les drogues, y compris le refus d’un test légal. Les provinces ajoutent des suspensions et des sanctions administratives. En permis progressif (apprenti ou intermédiaire), la norme attendue est généralement zéro — même une quantité qui serait légale pour un permis complet peut vous le faire perdre. Lisez le chapitre GDL de votre guide, pas une rumeur sur « un verre ».',
      ),
    ),
    TheorySection(
      heading: Copy(
        'Drugs, fatigue, and planning',
        'Drogues, fatigue et planification',
      ),
      body: Copy(
        'Cannabis, some prescriptions, and over-the-counter drugs can impair. Fatigue is treated as impairment in study material: stop and rest rather than “push through”. Plan a ride, transit, or a place to sleep before you drink or use cannabis. Open liquor in the passenger compartment is restricted; rules on storage belong in your provincial handbook. The morning after is still a risk if alcohol remains in your system.',
        'Le cannabis, certains médicaments et des produits en vente libre peuvent diminuer les facultés. La fatigue est traitée comme une forme d’inaptitude : arrêtez-vous plutôt que de « tenir le coup ». Prévoyez un transport, le transit ou un lieu pour dormir avant de boire ou de consommer du cannabis. L’alcool ouvert dans l’habitacle est encadré; les règles d’entreposage sont dans votre guide. Le lendemain matin reste un risque si l’alcool est encore dans le sang.',
      ),
    ),
  ],
  quizIds: ['impairment'],
);

const winterTopic = TheoryTopic(
  id: 'winter',
  title: Copy('Winter driving', 'Conduite d’hiver'),
  subtitle: Copy(
    'Ice, space, tires, and seeing the road',
    'Glace, espace, pneus et visibilité',
  ),
  lead: Copy(
    'Winter questions show up on knowledge tests even in milder regions. Slow down, see and be seen, and give yourself room. Tire rules are not the same in every province.',
    'Les questions d’hiver apparaissent même dans les régions plus douces. Ralentissez, voyez et soyez vu, et gardez de l’espace. Les règles de pneus ne sont pas les mêmes partout.',
  ),
  sections: [
    TheorySection(
      heading: Copy('Ice, space, and control', 'Glace, espace et maîtrise'),
      body: Copy(
        'Black ice is hard to see; if the wheel feels light, ease off the accelerator and avoid sudden steering or braking. Following distance should grow in snow and slush — a common study cue is to leave more than you would on dry pavement, not less. If the rear steps out, steer gently into the skid and do not slam the brakes. Use low gears on icy hills; momentum tricks are a good way to lose control.',
        'La glace noire se voit mal; si le volant devient léger, relâchez l’accélérateur et évitez les à-coups. L’intervalle doit augmenter dans la neige — un bon réflexe d’étude est d’en laisser plus, pas moins. Si l’arrière décroche, tournez doucement dans le dérapage et n’écrasez pas les freins. Utilisez un rapport bas dans les côtes glacées; prendre de l’élan est une bonne façon de perdre la maîtrise.',
      ),
      signIds: ['slippery'],
    ),
    TheorySection(
      heading: Copy('See, be seen, be equipped', 'Voir, être vu, être équipé'),
      body: Copy(
        'Clear all snow from windows, lights, and the roof so it does not blow onto the windshield — or onto the vehicle behind. Headlights help others see you in snow and dusk, even if you think you can see. Pack a winter kit (warmth, water, scraper, flashlight) if you travel outside town. If you are stuck in a blizzard, staying with the vehicle is usually safer than walking unless help is clearly close.',
        'Dégagez neige et glace des glaces, des feux et du toit pour qu’elles ne glissent pas sur le pare-brise — ou sur le véhicule derrière. Les phares aident les autres à vous voir dans la neige et le crépuscule. Prévoyez une trousse (chaleur, eau, grattoir, lampe) hors de la ville. Si vous êtes coincé dans un blizzard, rester dans le véhicule est en général plus sûr que de marcher, sauf si l’aide est clairement proche.',
      ),
    ),
  ],
  quizIds: ['winter'],
  provincialNotes: [
    ProvincialNote(
      appliesTo: ['QC'],
      heading: Copy('Québec winter tires', 'Québec : pneus d’hiver'),
      body: Copy(
        'Québec requires approved winter tires on passenger vehicles in winter. The usual window taught in study material is 1 December to 15 March — confirm the current dates and exceptions with the SAAQ before you travel.',
        'Le Québec exige des pneus d’hiver homologués sur les véhicules de tourisme en saison. La fenêtre souvent enseignée va du 1er décembre au 15 mars — confirmez les dates et exceptions actuelles auprès de la SAAQ avant de partir.',
      ),
    ),
  ],
);

const gdlTopic = TheoryTopic(
  id: 'gdl',
  title: Copy('Graduated licensing', 'Permis progressif'),
  subtitle: Copy(
    'Learner, intermediate, then a full licence',
    'Apprenti, intermédiaire, puis permis complet',
  ),
  lead: Copy(
    'Most provinces and territories use a graduated system: a knowledge test, a supervised learner stage, a road test, then an intermediate stage with night, passenger, or alcohol limits, then a full licence. Names (G1, Class 7L, Class 5-GDL) differ. Pick a province on this tab to see that place’s stages from our unofficial summary — then open the official handbook.',
    'La plupart des provinces et territoires utilisent un permis progressif : examen de connaissances, étape d’apprenti supervisé, examen pratique, étape intermédiaire (nuit, passagers ou alcool), puis permis complet. Les noms (G1, classe 7L, classe 5-GDL) changent. Choisissez un lieu sur cet onglet pour voir nos résumés non officiels — puis ouvrez le guide officiel.',
  ),
  sections: [
    TheorySection(
      heading: Copy('What GDL is trying to do', 'Le but du permis progressif'),
      body: Copy(
        'Graduated licensing adds time and supervision while crash risk is highest. Typical shared ideas: pass a knowledge test before you drive on a highway as a learner; carry a supervising fully licensed driver; display an L or similar sign where required; keep alcohol and drugs at zero; wait a minimum time and often a minimum age before the road test. None of those waits are the same length everywhere — never memorize one national timetable.',
        'Le permis progressif ajoute du temps et de la supervision quand le risque d’accident est le plus élevé. Idées souvent partagées : réussir l’examen de connaissances avant de conduire en apprenti; être accompagné d’un conducteur pleinement titulaire; afficher un L ou l’équivalent s’il est exigé; garder alcool et drogues à zéro; attendre un temps et souvent un âge minimum avant l’examen pratique. Ces délais ne sont pas les mêmes partout — n’apprenez pas un calendrier national unique.',
      ),
    ),
    TheorySection(
      heading: Copy(
        'Knowledge test, then the road',
        'Connaissances, puis la route',
      ),
      body: Copy(
        'The knowledge test is unofficially practised here; the official sitting is at a government or insurer office, often with vision screening the same day. Passing it does not skip the learner restrictions. The road test checks control, observation, and lawful driving — not whether you memorised this app. Use the Licences tab for documents, fees (only when published), and handbook links.',
        'L’examen de connaissances se pratique ici de façon non officielle; la vraie séance a lieu dans un bureau gouvernemental ou d’assureur, souvent avec un test de vision le même jour. Le réussir ne lève pas les limites d’apprenti. L’examen pratique vérifie la maîtrise, l’observation et la conduite légale — pas la mémorisation de cette appli. L’onglet Permis donne les pièces, les tarifs (s’ils sont publiés) et les liens vers les guides.',
      ),
    ),
  ],
  quizIds: ['gdl'],
  usesJurisdictionGdl: true,
);

const List<TheoryTopic> allTheoryTopics = [
  signsTopic,
  rulesTopic,
  impairmentTopic,
  winterTopic,
  gdlTopic,
];

TheoryTopic? theoryTopicById(String id) {
  for (final topic in allTheoryTopics) {
    if (topic.id == id) return topic;
  }
  return null;
}

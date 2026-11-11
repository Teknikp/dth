import '../models/jurisdiction.dart';
import '../models/theory.dart';

const pointsTopic = TheoryTopic(
  id: 'points',
  title: Copy('Demerit and penalty points', 'Points d’inaptitude et pénalités'),
  subtitle: Copy(
    'Each province and territory publishes its own system',
    'Chaque province et territoire publie son propre régime',
  ),
  lead: Copy(
    'There is no single Canadian demerit table. Ontario uses demerit points, Québec uses points d’inaptitude, B.C. uses Driver Penalty Points that affect ICBC premiums, and Manitoba uses a Driver Safety Rating scale. Numbers below are copied from official pages, then linked. Confirm the cited page before you treat a threshold as current.',
    'Il n’y a pas de tableau canadien unique. L’Ontario utilise des points d’inaptitude, le Québec aussi, la C.-B. des Driver Penalty Points qui touchent les primes ICBC, et le Manitoba une cote de sécurité. Les chiffres ci-dessous viennent des pages officielles, avec liens. Confirmez la page citée avant d’utiliser un seuil.',
  ),
  sections: [
    TheorySection(
      heading: Copy(
        'What these systems are for',
        'À quoi servent ces régimes',
      ),
      body: Copy(
        'Licensing authorities record convictions (and sometimes at-fault crashes) and attach points or a rating change. After enough points, the authority may warn you, require a course or interview, raise an insurance premium, or suspend the licence. Novice and learner licences often trigger action at a lower total than a full licence. None of that is a knowledge-test “trick question” invented here — it is whatever that official page currently publishes.',
        'Les autorités inscrivent les condamnations (et parfois les collisions avec responsabilité) et y attachent des points ou un changement de cote. Passé un seuil, elles peuvent avertir, exiger un cours ou une entrevue, hausser une prime, ou suspendre le permis. Les permis d’apprenti et novice déclenchent souvent une mesure plus tôt. Ce n’est pas une question piège inventée ici — c’est le texte actuel de la page officielle.',
      ),
    ),
    TheorySection(
      heading: Copy(
        'How long points usually stay',
        'Combien de temps les points restent',
      ),
      body: Copy(
        'Many pages say points drop off two years after the offence or conviction date — but the start date is not the same everywhere (offence date in Ontario, conviction date in several others). B.C.’s Driver Penalty Point premium looks at points in a 12-month period. Always read the cited page for the clock, reinstatement leftovers after a suspension, and any course that can remove points.',
        'Plusieurs pages disent que les points tombent deux ans après l’infraction ou la déclaration de culpabilité — mais le point de départ n’est pas le même (date de l’infraction en Ontario, date de la condamnation ailleurs). La prime de points de pénalité de la C.-B. regarde une période de 12 mois. Lisez la page citée pour le délai, les points restants après une suspension, et tout cours qui peut en retirer.',
      ),
    ),
    TheorySection(
      heading: Copy(
        'This is not a national pass mark',
        'Ce n’est pas une note de passage nationale',
      ),
      body: Copy(
        'Knowledge tests and point systems are different things. A mock exam score in this app is unofficial study. Point thresholds are licence-record rules after convictions, not “how many quiz items you may miss.”',
        'L’examen de connaissances et le régime de points sont distincts. Un score d’examen blanc ici est une étude non officielle. Les seuils de points concernent le dossier après des condamnations, pas « combien de questions vous pouvez manquer ».',
      ),
    ),
  ],
  quizIds: ['points', 'mock'],
  showAllNotesWhenNational: true,
  provincialNotes: [
    ProvincialNote(
      appliesTo: ['ON'],
      heading: Copy('Ontario demerit points', 'Ontario : points d’inaptitude'),
      body: Copy(
        'You start with zero and gain points after a conviction. Points stay for two years from the offence date. Fully licensed: warning letters at 6–8 and 9–14 points; 15 or more can bring a 30-day suspension. G1/G2 novice: warnings at 2–5 and 6–8; 9 or more can bring a 60-day suspension. After a suspension Ontario says a fully licensed driver is left with 7 points and a novice with 4. Examples on the same page: 6 points for a school-bus offence, careless driving, or racing; 3 points for handheld use.',
        'Vous partez de zéro et accumulez des points après une déclaration de culpabilité. Ils restent deux ans à compter de la date de l’infraction. Permis complet : lettres à 6–8 et 9–14 points; 15 ou plus peut valoir 30 jours de suspension. G1/G2 : avis à 2–5 et 6–8; 9 ou plus peut valoir 60 jours. Après une suspension, l’Ontario indique 7 points restants (permis complet) ou 4 (novice). Exemples sur la même page : 6 points (autobus scolaire, conduite imprudente, course); 3 points pour un appareil portatif.',
      ),
      sources: [
        OfficialLink(
          label: 'Ontario — Understanding demerit points',
          url: 'https://www.ontario.ca/page/understanding-demerit-points',
        ),
      ],
    ),
    ProvincialNote(
      appliesTo: ['QC'],
      heading: Copy(
        'Québec demerit points (SAAQ)',
        'Québec : points d’inaptitude (SAAQ)',
      ),
      body: Copy(
        'The SAAQ table of limit of demerit points (and the paired French table) publishes: 4 points for a learner or probationary licence; 8 if you are under 23; 12 at age 23 or 24; 15 at 25 or over. Points are entered after conviction and generally drop off two years after the conviction date. Reaching the limit can lead to revocation for 3, 6, or 12 months as that SAAQ page describes. Read the current PDF — do not treat this paragraph as the table.',
        'Le tableau SAAQ de la limite de points d’inaptitude publie : 4 points pour un permis d’apprenti ou probatoire; 8 si vous avez moins de 23 ans; 12 à 23 ou 24 ans; 15 à 25 ans ou plus. Les points s’inscrivent après la déclaration de culpabilité et tombent généralement deux ans après cette date. Atteindre la limite peut mener à une révocation de 3, 6 ou 12 mois, selon la page. Lisez le PDF actuel — ce paragraphe n’est pas le tableau.',
      ),
      sources: [
        OfficialLink(
          label: 'SAAQ — Demerit points and your licence (PDF)',
          url:
              'https://saaq.gouv.qc.ca/fileadmin/documents/publications/demerit-points-driver-licence.pdf',
        ),
      ],
    ),
    ProvincialNote(
      appliesTo: ['BC'],
      heading: Copy(
        'B.C. Driver Penalty Points (ICBC)',
        'C.-B. : Driver Penalty Points (ICBC)',
      ),
      body: Copy(
        'British Columbia does not copy Ontario’s 15-point licence-suspension table. ICBC’s Driver Penalty Point (DPP) premium is an insurance surcharge when you have 4 or more driver penalty points in a 12-month period. ICBC’s distracted-driving page publishes a ticket example of \$368 plus 4 driver penalty points. Point values for other offences are on ICBC’s fines-and-points lookup. Confirm both pages; premiums and fines change.',
        'La Colombie-Britannique ne reprend pas le tableau ontarien de suspension à 15 points. La prime de points de pénalité (DPP) de l’ICBC est une surprime d’assurance dès 4 points ou plus sur 12 mois. La page sur la conduite avec distraction publie l’exemple d’une contravention de 368 \$ plus 4 points. Les autres valeurs sont dans l’outil amendes et points. Confirmez les deux pages; primes et amendes changent.',
      ),
      sources: [
        OfficialLink(
          label: 'ICBC — Driver Penalty Points premium',
          url:
              'https://www.icbc.com/insurance/costs/driver-penalty-points-premium',
        ),
        OfficialLink(
          label: 'ICBC — Distracted driving',
          url:
              'https://www.icbc.com/driver-licensing/tickets/distracted-driving',
        ),
      ],
    ),
    ProvincialNote(
      appliesTo: ['AB'],
      heading: Copy(
        'Alberta demerit suspensions',
        'Alberta : suspensions pour points',
      ),
      body: Copy(
        'Alberta’s demerit driving suspension page: points stay two years from the conviction date. Fully licensed: a caution letter at 8–14 points; 15 or more brings a 1-month suspension the first time, 3 months if it happens again within a year, and 6 months for a third time within two years. After that suspension the record is reinstated with 7 points. GDL (Class 7, 5-GDL, 6-GDL): caution at 4–7 points; 8 or more is a 1-month suspension, reinstated with 3 points.',
        'Page albertaine des suspensions : les points restent deux ans à compter de la date de la déclaration de culpabilité. Permis complet : lettre à 8–14 points; 15 ou plus vaut 1 mois la première fois, 3 mois si ça se reproduit dans l’année, 6 mois la troisième fois en deux ans. Après la suspension, le dossier reprend avec 7 points. GDL (classes 7, 5-GDL, 6-GDL) : avis à 4–7; 8 ou plus = 1 mois, puis 3 points restants.',
      ),
      sources: [
        OfficialLink(
          label: 'Alberta — Demerit driving suspension',
          url: 'https://www.alberta.ca/demerit-driving-suspension',
        ),
      ],
    ),
    ProvincialNote(
      appliesTo: ['SK'],
      heading: Copy(
        'Saskatchewan Driver Improvement Program',
        'Saskatchewan : programme d’amélioration',
      ),
      body: Copy(
        'SGI’s Driver Improvement Program assigns points for convictions and at-fault collisions. The handbook table: information letter at 9 or more points; warning letter at 12; Defensive Driving Course at 15; Driver Improvement Training at 18; then 30-day, 90-day, and 180-day suspensions at 21, 24, and 27; interview at 30; SGI manual review at 33. That is not Ontario’s 15-point / 30-day pair — read SGI.',
        'Le programme d’amélioration de la SGI attribue des points pour les condamnations et les collisions avec responsabilité. Tableau du guide : lettre à 9 points ou plus; avertissement à 12; cours de conduite défensive à 15; formation à 18; puis suspensions de 30, 90 et 180 jours à 21, 24 et 27; entrevue à 30; examen SGI à 33. Ce n’est pas le couple ontarien 15 points / 30 jours — lisez la SGI.',
      ),
      sources: [
        OfficialLink(
          label: 'SGI — Driver Improvement Program',
          url:
              'https://sgi.sk.ca/handbook/-/knowledge_base/drivers/driver-improvement-program',
        ),
      ],
    ),
    ProvincialNote(
      appliesTo: ['MB'],
      heading: Copy(
        'Manitoba Driver Safety Rating (not classic demerit)',
        'Manitoba : cote de sécurité (pas un barème classique)',
      ),
      body: Copy(
        'Manitoba Public Insurance uses a Driver Safety Rating (DSR) scale, not an Ontario-style “15 points then suspend” table. MPI describes a 41-level scale from +20 to −20. Safe years move you up (premium discounts); convictions, at-fault claims, and impaired or distracted events move you down (higher premiums, including a high driver premium at the bottom). Use MPI’s DSR page and calculator — do not convert DSR levels into demerit points.',
        'Société d’assurance publique du Manitoba : cote de sécurité (DSR), pas un tableau « 15 points puis suspension ». MPI décrit 41 niveaux de +20 à −20. Les années sans incident font monter (rabais); condamnations, réclamations avec responsabilité, alcool ou distraction font descendre (primes plus élevées). Utilisez la page et le calculateur MPI — ne convertissez pas la cote en points d’inaptitude.',
      ),
      sources: [
        OfficialLink(
          label: 'MPI — Driver Safety Rating',
          url: 'https://www.mpi.mb.ca/driver-safety-rating/',
        ),
      ],
    ),
    ProvincialNote(
      appliesTo: ['NS'],
      heading: Copy(
        'Nova Scotia point system',
        'Nouvelle-Écosse : régime de points',
      ),
      body: Copy(
        'Nova Scotia’s Registry of Motor Vehicles point page: points stay two years from the conviction date. Learner licence: suspension at 4 points. Newly licensed: interview at 4 points and a 6-month suspension at 6. All other drivers: interview at 6 points and a 6-month suspension at 10. Read the current SNS page for how an interview can change what happens next.',
        'Page de la Registraire : les points restent deux ans à compter de la date de la déclaration de culpabilité. Permis d’apprenti : suspension à 4 points. Nouveau titulaire : entrevue à 4 points et suspension de 6 mois à 6. Autres conducteurs : entrevue à 6 points et suspension de 6 mois à 10. Lisez la page SNS pour ce que l’entrevue peut changer.',
      ),
      sources: [
        OfficialLink(
          label: 'Nova Scotia — Point system',
          url: 'https://novascotia.ca/sns/rmv/licence/point.asp',
        ),
      ],
    ),
    ProvincialNote(
      appliesTo: ['NB'],
      heading: Copy(
        'New Brunswick Motor Vehicle Act warnings',
        'Nouveau-Brunswick : avis de la Loi',
      ),
      body: Copy(
        'The Motor Vehicle Act (section 297) tells the Registrar to assess listed points on conviction and to send a written warning at 3 or more points, and another written warning at 7 or more but fewer than 10 points. This study note does not invent a 10-point suspension length, because that page of the Act as fetched here publishes those warnings and the point schedule — not a simple Ontario-style suspension table. Read the current Act.',
        'La Loi sur les véhicules à moteur (art. 297) prescrit d’inscrire les points prévus à la condamnation, d’envoyer un avertissement écrit à 3 points ou plus, et un autre entre 7 et moins de 10 points. Cette note n’invente pas une durée de suspension à 10 points : le texte consulté publie ces avis et le barème, pas un tableau ontarien. Lisez la Loi en vigueur.',
      ),
      sources: [
        OfficialLink(
          label: 'New Brunswick Motor Vehicle Act (M-17)',
          url: 'https://laws.gnb.ca/en/document/cs/M-17',
        ),
      ],
    ),
    ProvincialNote(
      appliesTo: ['PE'],
      heading: Copy(
        'Prince Edward Island demerit points',
        'Île-du-Prince-Édouard : points d’inaptitude',
      ),
      body: Copy(
        'PEI’s demerit-point page: an experienced driver (licence more than two years) who accumulates 12 points within two years is suspended for three months. Warnings at 6–8 points; interview at 9–11. Graduated Stage 1 (beginner): suspension for any demerit-point violation. Stage 2: warning at 3–5, one-month suspension at 6. Stage 3: warning at 5–8, one-month suspension at 9. After a suspension, PEI places the driver on one-year probation. Confirm the government page.',
        'Page de l’Î.-P.-É. : un conducteur expérimenté (permis depuis plus de deux ans) qui atteint 12 points en deux ans est suspendu trois mois. Avis à 6–8 points; entrevue à 9–11. Étape 1 (débutant) : suspension pour toute infraction avec points. Étape 2 : avis à 3–5, un mois à 6. Étape 3 : avis à 5–8, un mois à 9. Après une suspension, probation d’un an. Confirmez la page gouvernementale.',
      ),
      sources: [
        OfficialLink(
          label: 'PEI — Demerit Point System for Drivers',
          url:
              'https://www.princeedwardisland.ca/en/information/transportation-and-infrastructure/demerit-point-system-for-drivers',
        ),
      ],
    ),
    ProvincialNote(
      appliesTo: ['NL'],
      heading: Copy(
        'Newfoundland and Labrador demerit points',
        'Terre-Neuve-et-Labrador : points d’inaptitude',
      ),
      body: Copy(
        'Motor Registration: Class 1–6 drivers get a written notice at 6 points, another at 9, and a suspension at 12 points within two years. Novice (Class 5I/5II, 6I/6II): notice at 3 points; suspension at 6 points within one year. First demerit suspension is two months; later ones four months on that page (novice demerit suspensions are also listed as 2 / 4 / 6 months on the GDL page). Points come off two years after the conviction date.',
        'Immatriculation : classes 1 à 6 — avis écrit à 6 points, un autre à 9, suspension à 12 points en deux ans. Novice (5I/5II, 6I/6II) : avis à 3 points; suspension à 6 points en un an. Première suspension : deux mois; suivantes : quatre mois sur cette page (la page GDL indique aussi 2 / 4 / 6 mois pour les novices). Les points tombent deux ans après la date de la déclaration de culpabilité.',
      ),
      sources: [
        OfficialLink(
          label: 'Newfoundland and Labrador — Demerit Point System',
          url:
              'https://www.gov.nl.ca/motorregistration/existing-drivers/driver-records-and-suspended-drivers/demerit-point-system/',
        ),
      ],
    ),
    ProvincialNote(
      appliesTo: ['YT'],
      heading: Copy('Yukon demerit suspensions', 'Yukon : suspensions'),
      body: Copy(
        'Yukon’s suspension page: GDL drivers are suspended at 7 or more demerit points; all other licence holders at 15 or more. Length: 1 month the first time; 3 months for a second within one year; 6 months for three or more demerit-point suspensions within two years. Traffic tickets also add the points published on Yukon’s speeding and related pages.',
        'Page yukonnaise : les conducteurs GDL sont suspendus à 7 points ou plus; les autres à 15 ou plus. Durée : 1 mois la première fois; 3 mois pour une deuxième en un an; 6 mois pour trois suspensions ou plus en deux ans. Les contraventions ajoutent aussi les points publiés sur les pages d’excès de vitesse.',
      ),
      sources: [
        OfficialLink(
          label: 'Yukon — How your licence could become suspended',
          url:
              'https://yukon.ca/en/driving-and-transportation/driving-offences-and-penalties/find-out-how-your-licence-could-become-suspended',
        ),
      ],
    ),
    ProvincialNote(
      appliesTo: ['NT'],
      heading: Copy(
        'Northwest Territories demerit points',
        'Territoires du Nord-Ouest : points d’inaptitude',
      ),
      body: Copy(
        'NWT Infrastructure (IDMV): points stay 24 months. Class 7 and 5P: 6 points brings a 30-day suspension (and a 12-month clean period before upgrading). All drivers: mail notice at 8 points (no extra restriction on that step); 12 or more requires an interview (miss it and the licence can be suspended until you attend); 15 points is a 30-day suspension. A second 15-point accumulation can suspend from 30 days up to two years. An approved driver-improvement course may reduce points once in two years.',
        'IDMV : les points restent 24 mois. Classes 7 et 5P : 6 points = 30 jours de suspension (et 12 mois sans suspension avant une hausse de classe). Tous : avis postal à 8 points; 12 ou plus = entrevue (absence = suspension jusqu’à l’entrevue); 15 points = 30 jours. Une deuxième fois à 15 peut valoir de 30 jours à deux ans. Un cours d’amélioration approuvé peut réduire les points une fois en deux ans.',
      ),
      sources: [
        OfficialLink(
          label: 'NWT — Demerit points and suspensions',
          url:
              'https://www.idmv.inf.gov.nt.ca/Drivers/DriverHistory/Demerit-points-and-suspensions',
        ),
      ],
    ),
    ProvincialNote(
      appliesTo: ['NU'],
      heading: Copy(
        'Nunavut demerit regulations (read the text)',
        'Nunavut : règlement (lire le texte)',
      ),
      body: Copy(
        'Nunavut publishes Driver’s Licence Demerit Point Regulations. This app does not copy threshold numbers from another territory onto Nunavut. Open the current consolidation for how points are added, how long they stay, and what the Registrar must do at each step. Nunavut’s GDL timetable is still thin on other pages in this app; the regulation is the demerit source to read.',
        'Le Nunavut publie le Règlement sur les points d’inaptitude en matière de permis de conduire. Cette appli ne recopie pas les seuils d’un autre territoire. Ouvrez la consolidation pour l’ajout des points, leur durée et les mesures du registraire. L’horaire GDL du Nunavut reste mince ailleurs dans l’appli; le règlement est la source à lire pour les points.',
      ),
      sources: [
        OfficialLink(
          label: 'Nunavut — Driver’s Licence Demerit Point Regulations',
          url:
              'https://www.nunavutlegislation.ca/en/consolidated-law/drivers-licence-demerit-point-regulations-consolidation',
        ),
      ],
    ),
  ],
);

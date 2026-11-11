import '../models/quiz.dart';

const List<PracticeQuestion> extraQuestions = [
  PracticeQuestion(
    id: 'sign-no-right',
    prompt: 'What does this sign mean?',
    choices: [
      'Keep right',
      'No right turn',
      'Right lane ends',
      'Hospital to the right',
    ],
    correctIndex: 1,
    explanation:
        'A red ring around a right-turn arrow with a slash forbids that turn. Turn only where a sign or signal allows it.',
    topic: 'Signs',
    signId: 'no_right_turn',
  ),
  PracticeQuestion(
    id: 'sign-no-parking',
    prompt: 'What does this sign mean?',
    choices: [
      'Parking allowed for 5 minutes',
      'No parking',
      'Hospital parking only',
      'No passing',
    ],
    correctIndex: 1,
    explanation:
        'A blue disc with a red ring, a P, and a slash is the study-aid no-parking sign. You may stop only if a local rule still allows a brief stop — confirm the plate and any arrows on the real sign.',
    topic: 'Signs',
    signId: 'no_parking',
  ),
  PracticeQuestion(
    id: 'sign-no-stopping',
    prompt: 'What does this sign mean?',
    choices: [
      'No stopping',
      'Railway crossing',
      'Do not enter',
      'Yield',
    ],
    correctIndex: 0,
    explanation:
        'A blue disc with a red ring and a red X is the study-aid no-stopping sign. Do not stop in that zone except as the official handbook allows (for example some emergency exceptions).',
    topic: 'Signs',
    signId: 'no_stopping',
  ),
  PracticeQuestion(
    id: 'sign-keep-right',
    prompt: 'What does this sign tell you?',
    choices: [
      'Keep right of the hazard or median ahead',
      'No right turn',
      'One way to the left',
      'Parking on the right only',
    ],
    correctIndex: 0,
    explanation:
        'Yellow diamonds warn. This drawing shows a keep-right path around an island or obstacle. Move right of the object; do not cut left of it.',
    topic: 'Signs',
    signId: 'keep_right',
  ),
  PracticeQuestion(
    id: 'sign-two-way',
    prompt: 'What does this sign warn you about?',
    choices: [
      'A one-way street begins',
      'Two-way traffic ahead',
      'No passing either way',
      'A freeway ends',
    ],
    correctIndex: 1,
    explanation:
        'Opposing arrows on a warning diamond mean two-way traffic — often after a one-way stretch or a divided-road end. Keep right and watch oncoming vehicles.',
    topic: 'Signs',
    signId: 'two_way',
  ),
  PracticeQuestion(
    id: 'sign-merge',
    prompt: 'What does this sign mean?',
    choices: [
      'Road narrows on both sides',
      'Traffic from another lane or ramp will merge',
      'Do not enter',
      'Stop ahead',
    ],
    correctIndex: 1,
    explanation:
        'A merge warning means two streams of traffic come together. Adjust speed and leave a gap; the driver already in the continuing lane is not required to move over, but both should cooperate.',
    topic: 'Signs',
    signId: 'merge',
  ),
  PracticeQuestion(
    id: 'sign-winding',
    prompt: 'What does this sign mean?',
    choices: [
      'Winding road ahead — adjust speed',
      'Roundabout',
      'Slippery when wet only',
      'No U-turn',
    ],
    correctIndex: 0,
    explanation:
        'A winding-road warning means a series of curves. Slow to a speed you can hold in your lane; a single-curve sign is different from a winding series.',
    topic: 'Signs',
    signId: 'winding',
  ),
  PracticeQuestion(
    id: 'sign-hospital',
    prompt: 'What does this sign indicate?',
    choices: [
      'School zone',
      'Hospital',
      'Highway help phone',
      'No stopping',
    ],
    correctIndex: 1,
    explanation:
        'A blue square with H is a study-aid hospital / medical-services sign. It guides you; it is not a stop or speed-limit sign.',
    topic: 'Signs',
    signId: 'hospital',
  ),
  PracticeQuestion(
    id: 'sign-wildlife',
    prompt: 'What does this sign warn you about?',
    choices: [
      'Livestock auction ahead',
      'Wildlife may enter the road — be ready to slow',
      'Zoo parking',
      'No passing because of animals',
    ],
    correctIndex: 1,
    explanation:
        'An animal silhouette on a yellow diamond warns that wildlife may cross. Slow if you see eyeshine or movement, and never swerve into oncoming traffic.',
    topic: 'Signs',
    signId: 'wildlife',
  ),
  PracticeQuestion(
    id: 'sign-stop-ahead',
    prompt: 'What does this sign mean?',
    choices: [
      'Stop now in the lane',
      'Stop sign ahead — prepare to stop',
      'Stop only for school buses',
      'Yield ahead',
    ],
    correctIndex: 1,
    explanation:
        'A warning diamond with a stop symbol means a stop sign is coming, often hidden by a curve or hill. Get ready to stop; the legal stop is at the stop sign, not at this warning.',
    topic: 'Signs',
    signId: 'stop_ahead',
  ),
  PracticeQuestion(
    id: 'sign-signal-ahead',
    prompt: 'What does this sign mean?',
    choices: [
      'Traffic signals ahead',
      'The next light is always flashing yellow',
      'Railway crossing with lights only',
      'Do not enter',
    ],
    correctIndex: 0,
    explanation:
        'A warning diamond with a signal drawing means traffic lights ahead, often where you might not expect them. Be ready to stop on yellow or red.',
    topic: 'Signs',
    signId: 'signal_ahead',
  ),
  PracticeQuestion(
    id: 'sign-maximum-80',
    prompt: 'What does this sign mean?',
    choices: [
      'Recommended speed 80 in the rain only',
      'The posted maximum speed is 80 km/h',
      'Minimum speed 80 km/h',
      'Exit speed 80 km/h',
    ],
    correctIndex: 1,
    explanation:
        'MAXIMUM with a number is a regulatory speed limit in kilometres per hour unless another unit is posted. Going faster is an offence; conditions may still require slower driving.',
    topic: 'Signs',
    signId: 'maximum_80',
  ),
  PracticeQuestion(
    id: 'sign-no-passing',
    prompt: 'What does this sign warn you about?',
    choices: [
      'Two-way traffic with no passing in this stretch',
      'One-way street',
      'Keep left to pass',
      'Parking on both sides',
    ],
    correctIndex: 0,
    explanation:
        'A no-passing warning works with pavement markings. Do not pass where a solid yellow line is on your side or where a sign forbids it.',
    topic: 'Signs',
    signId: 'no_passing',
  ),
  PracticeQuestion(
    id: 'sign-playground',
    prompt: 'What does this sign mark?',
    choices: [
      'A playground or park area — watch for children',
      'A commercial truck route',
      'A hospital emergency bay',
      'A railway crossing',
    ],
    correctIndex: 0,
    explanation:
        'A fluorescent pentagon can mark a playground or school-related area, similar in idea to a school crossing sign. Watch for children; a separate sign may post a speed.',
    topic: 'Signs',
    signId: 'playground',
  ),
  PracticeQuestion(
    id: 'pts-not-national',
    prompt: 'Demerit or penalty-point systems in Canada:',
    choices: [
      'Use one federal table of 15 points then a 30-day suspension everywhere',
      'Are set by each province or territory (and sometimes an insurer), with different names and thresholds',
      'Apply only to commercial licences',
      'Are unpublished in every jurisdiction',
    ],
    correctIndex: 1,
    explanation:
        'Ontario demerit, Québec points d’inaptitude, B.C. Driver Penalty Points, Manitoba’s Driver Safety Rating, and others are not the same table. Study the place you will be licensed.',
    topic: 'Points',
    sourceNote:
        'Unofficial comparison of official provincial and territorial pages linked in the Points theory topic.',
  ),
  PracticeQuestion(
    id: 'pts-gdl-lower',
    prompt: 'On a learner or novice licence, point thresholds typically:',
    choices: [
      'Are higher than for a full licence because you are still learning',
      'Are often lower — action can start after fewer points than a full licence',
      'Never apply until you have a full Class 5 / G licence',
      'Are the same number in every province',
    ],
    correctIndex: 1,
    explanation:
        'Examples on official pages: Ontario G1/G2 action from 2–9 points vs 6–15 for a full licence; Alberta GDL caution from 4 points; Nova Scotia learners at 4. Always read that place’s page.',
    topic: 'Points',
    sourceNote:
        'Unofficial study item comparing published GDL vs full-licence thresholds on official pages.',
  ),
  PracticeQuestion(
    id: 'pts-on-zero',
    prompt: 'In Ontario, a driver with no convictions starts with:',
    choices: [
      '15 demerit points that are then subtracted',
      'Zero demerit points, then points are added after convictions',
      '7 points “in the bank”',
      'A Driver Safety Rating of +15',
    ],
    correctIndex: 1,
    explanation:
        'Ontario’s understanding-demerit-points page: you start with zero and gain points. They stay two years from the offence date.',
    topic: 'Points',
    appliesTo: ['ON'],
    sourceNote:
        'Ontario — Understanding demerit points: https://www.ontario.ca/page/understanding-demerit-points',
  ),
  PracticeQuestion(
    id: 'pts-on-15',
    prompt: 'In Ontario, a fully licensed driver who reaches 15 demerit points:',
    choices: [
      'Loses the licence for 30 days (as that official page currently describes)',
      'Is only sent a warning letter',
      'Is always jailed',
      'Has the same 60-day novice suspension',
    ],
    correctIndex: 0,
    explanation:
        'Ontario: fully licensed 6–8 first warning, 9–14 second warning, 15 or more a 30-day suspension. After the suspension the page says 7 points remain. Novice G1/G2 9 or more is a 60-day suspension, not 30.',
    topic: 'Points',
    appliesTo: ['ON'],
    sourceNote:
        'Ontario — Understanding demerit points: https://www.ontario.ca/page/understanding-demerit-points',
  ),
  PracticeQuestion(
    id: 'pts-on-novice',
    prompt: 'Ontario G1 or G2 drivers reach a 60-day demerit suspension at:',
    choices: [
      '2 points',
      '9 or more points',
      '15 points, same as a full G licence',
      'There is no novice demerit rule in Ontario',
    ],
    correctIndex: 1,
    explanation:
        'Ontario novice: warning at 2–5, second warning at 6–8, 60-day suspension at 9 or more. After that suspension 4 points remain on the page.',
    topic: 'Points',
    appliesTo: ['ON'],
    sourceNote:
        'Ontario — Understanding demerit points: https://www.ontario.ca/page/understanding-demerit-points',
  ),
  PracticeQuestion(
    id: 'pts-on-handheld',
    prompt: 'Ontario’s demerit page lists handheld-device use as:',
    choices: [
      '0 points (fine only)',
      '3 demerit points',
      '15 demerit points',
      'A Driver Penalty Point premium only',
    ],
    correctIndex: 1,
    explanation:
        'The Ontario demerit page lists 3 points for handheld use, and 6 for examples such as a school-bus offence, careless driving, or racing. Confirm the live table.',
    topic: 'Points',
    appliesTo: ['ON'],
    sourceNote:
        'Ontario — Understanding demerit points: https://www.ontario.ca/page/understanding-demerit-points',
  ),
  PracticeQuestion(
    id: 'pts-qc-learner',
    prompt: 'The SAAQ limit of demerit points for a learner or probationary licence is:',
    choices: [
      '4 points',
      '15 points, same as age 25+',
      '8 points at every age',
      'Unpublished',
    ],
    correctIndex: 0,
    explanation:
        'SAAQ table: 4 points learner/probationary; 8 under 23; 12 at 23–24; 15 at 25 or over. Points generally fall two years after conviction. Reaching the limit can mean revocation for 3, 6, or 12 months as that PDF describes.',
    topic: 'Points',
    appliesTo: ['QC'],
    sourceNote:
        'SAAQ demerit-points PDF: https://saaq.gouv.qc.ca/fileadmin/documents/publications/demerit-points-driver-licence.pdf',
  ),
  PracticeQuestion(
    id: 'pts-qc-25',
    prompt: 'On a regular Québec licence at age 25 or over, the SAAQ point limit is:',
    choices: [
      '4',
      '8',
      '12',
      '15',
    ],
    correctIndex: 3,
    explanation:
        'SAAQ: 15 points at 25 or over on a regular licence. Younger regular-licence limits are 8 (under 23) and 12 (23 or 24).',
    topic: 'Points',
    appliesTo: ['QC'],
    sourceNote:
        'SAAQ demerit-points PDF: https://saaq.gouv.qc.ca/fileadmin/documents/publications/demerit-points-driver-licence.pdf',
  ),
  PracticeQuestion(
    id: 'pts-bc-dpp',
    prompt: 'ICBC Driver Penalty Points (DPP) are primarily:',
    choices: [
      'An Ontario-style 15-point licence suspension table',
      'An insurance premium when you have 4 or more driver penalty points in a 12-month period',
      'A federal Criminal Code score',
      'Unused in British Columbia',
    ],
    correctIndex: 1,
    explanation:
        'ICBC’s DPP premium is a surcharge at 4 or more points in 12 months. That is not the same as Ontario’s 15-point / 30-day licence suspension. ICBC also publishes ticket examples such as distracted driving with points plus a fine.',
    topic: 'Points',
    appliesTo: ['BC'],
    sourceNote:
        'ICBC Driver Penalty Points premium and distracted-driving pages.',
  ),
  PracticeQuestion(
    id: 'pts-ab-15',
    prompt: 'Alberta’s page for a fully licensed driver at 15 or more demerit points (first time) is:',
    choices: [
      'A caution letter only',
      'A 1-month suspension, then the record reinstated with 7 points',
      'A 60-day novice-style suspension',
      'Automatic Criminal Code charges',
    ],
    correctIndex: 1,
    explanation:
        'Alberta: full licence caution at 8–14; 15+ is 1 month first time, 3 months if it happens again within a year, 6 months the third time within two years. Reinstated with 7 points. Points stay two years from the conviction date.',
    topic: 'Points',
    appliesTo: ['AB'],
    sourceNote:
        'Alberta — Demerit driving suspension: https://www.alberta.ca/demerit-driving-suspension',
  ),
  PracticeQuestion(
    id: 'pts-ab-gdl',
    prompt: 'Alberta GDL (Class 7, 5-GDL, 6-GDL) is suspended at:',
    choices: [
      '15 points, same as a full licence',
      '8 or more points (1-month suspension; reinstated with 3 points)',
      '2 points',
      'There is no GDL demerit rule in Alberta',
    ],
    correctIndex: 1,
    explanation:
        'Alberta GDL: caution letter at 4–7 points; 8 or more a 1-month suspension, reinstated with 3 points.',
    topic: 'Points',
    appliesTo: ['AB'],
    sourceNote:
        'Alberta — Demerit driving suspension: https://www.alberta.ca/demerit-driving-suspension',
  ),
  PracticeQuestion(
    id: 'pts-sk-letter',
    prompt: 'SGI’s Driver Improvement Program sends a program information letter at:',
    choices: [
      '3 points',
      '9 or more points',
      '21 points (that step is a 30-day suspension)',
      '15 points only in Ontario',
    ],
    correctIndex: 1,
    explanation:
        'SGI table: information letter at 9+, warning at 12+, Defensive Driving Course at 15+, Driver Improvement Training at 18+, then 30/90/180-day suspensions at 21/24/27, interview at 30, review at 33.',
    topic: 'Points',
    appliesTo: ['SK'],
    sourceNote:
        'SGI Driver Improvement Program: https://sgi.sk.ca/handbook/-/knowledge_base/drivers/driver-improvement-program',
  ),
  PracticeQuestion(
    id: 'pts-mb-dsr',
    prompt: 'Manitoba Public Insurance uses which record system?',
    choices: [
      'Ontario’s 15-point demerit suspension table unchanged',
      'A Driver Safety Rating scale (MPI describes 41 levels from +20 to −20)',
      'ICBC Driver Penalty Points only',
      'No published safe-driving scale',
    ],
    correctIndex: 1,
    explanation:
        'MPI Driver Safety Rating is a premium scale, not a classic demerit suspension ladder. Convictions and at-fault claims move you down; safe years move you up. Do not convert DSR levels into Ontario demerit points.',
    topic: 'Points',
    appliesTo: ['MB'],
    sourceNote:
        'MPI Driver Safety Rating: https://www.mpi.mb.ca/driver-safety-rating/',
  ),
  PracticeQuestion(
    id: 'pts-ns-learner',
    prompt: 'Nova Scotia’s point page suspends a learner licence at:',
    choices: [
      '4 points',
      '10 points (that is the “all other drivers” suspension on that page)',
      '15 points',
      'There is no learner threshold',
    ],
    correctIndex: 0,
    explanation:
        'Nova Scotia: points stay two years from conviction. Learner: suspend at 4. Newly licensed: interview at 4, 6-month suspension at 6. All others: interview at 6, 6-month suspension at 10.',
    topic: 'Points',
    appliesTo: ['NS'],
    sourceNote:
        'Nova Scotia point system: https://novascotia.ca/sns/rmv/licence/point.asp',
  ),
  PracticeQuestion(
    id: 'pts-nl-12',
    prompt: 'In Newfoundland and Labrador, a Class 5 (non-novice) driver is suspended at:',
    choices: [
      '3 points',
      '12 points within a two-year period',
      '15 points as in Ontario',
      '6 points with no prior warning',
    ],
    correctIndex: 1,
    explanation:
        'NL: written notice at 6, another at 9, suspension at 12 points in two years for Class 1–6. Novice classes: notice at 3, suspend at 6 in one year. First demerit suspension two months on that page.',
    topic: 'Points',
    appliesTo: ['NL'],
    sourceNote:
        'NL Demerit Point System: https://www.gov.nl.ca/motorregistration/existing-drivers/driver-records-and-suspended-drivers/demerit-point-system/',
  ),
  PracticeQuestion(
    id: 'pts-yt-gdl',
    prompt: 'Yukon suspends a GDL driver for demerit points at:',
    choices: [
      '7 or more points',
      '15 or more points (that is the non-GDL threshold on the same page)',
      '4 points only',
      'Yukon does not publish a GDL demerit threshold',
    ],
    correctIndex: 0,
    explanation:
        'Yukon: GDL at 7 or more points; other licences at 15 or more. Length: 1 month first time; 3 months if a second within a year; 6 months for three or more demerit suspensions in two years.',
    topic: 'Points',
    appliesTo: ['YT'],
    sourceNote:
        'Yukon — how your licence could become suspended: https://yukon.ca/en/driving-and-transportation/driving-offences-and-penalties/find-out-how-your-licence-could-become-suspended',
  ),
  PracticeQuestion(
    id: 'pts-nt-24',
    prompt: 'Northwest Territories demerit points remain on the record for:',
    choices: [
      '6 months',
      '24 months',
      'Forever',
      'Until you leave the territory',
    ],
    correctIndex: 1,
    explanation:
        'NWT IDMV: points remain 24 months. Class 7 and 5P suspend at 6 points (30 days). Mail notice at 8; interview at 12 or more; 15 points a 30-day suspension.',
    topic: 'Points',
    appliesTo: ['NT'],
    sourceNote:
        'NWT demerit points and suspensions: https://www.idmv.inf.gov.nt.ca/Drivers/DriverHistory/Demerit-points-and-suspensions',
  ),
  PracticeQuestion(
    id: 'pts-nb-warn',
    prompt: 'New Brunswick’s Motor Vehicle Act (s. 297) requires a written warning when a driver has:',
    choices: [
      '7 or more but fewer than 10 points (and an earlier warning at 3 or more)',
      '15 points and a 30-day Ontario-style suspension, as copied here',
      'Zero points at issue',
      'A Driver Safety Rating of −20',
    ],
    correctIndex: 0,
    explanation:
        'MVA s. 297: warning at 3 or more points, and at 7 or more but fewer than 10. This question does not invent a 10-point suspension length — read the current Act for everything else.',
    topic: 'Points',
    appliesTo: ['NB'],
    sourceNote:
        'New Brunswick Motor Vehicle Act: https://laws.gnb.ca/en/document/cs/M-17',
  ),
  PracticeQuestion(
    id: 'pts-pe-12',
    prompt: 'On Prince Edward Island, an experienced driver (licence more than two years) is suspended for three months at:',
    choices: [
      '4 points',
      '12 demerit points within two years',
      '15 points as in Ontario',
      'PEI does not publish a demerit page',
    ],
    correctIndex: 1,
    explanation:
        'PEI page: experienced drivers — warning 6–8, interview 9–11, three-month suspension at 12 or more in two years. GDL Stage 1: any demerit-point violation can suspend; Stage 2 at 6 points (one month); Stage 3 at 9 (one month).',
    topic: 'Points',
    appliesTo: ['PE'],
    sourceNote:
        'PEI Demerit Point System for Drivers: https://www.princeedwardisland.ca/en/information/transportation-and-infrastructure/demerit-point-system-for-drivers',
  ),
  PracticeQuestion(
    id: 'pts-nu-regs',
    prompt: 'Nunavut’s demerit-point thresholds in this app:',
    choices: [
      'Are copied from Northwest Territories so you do not have to read Nunavut law',
      'Must be read in Nunavut’s Driver’s Licence Demerit Point Regulations — this app does not invent the numbers',
      'Do not exist because Nunavut has no legislation',
      'Are always 15 points / 30 days everywhere in Canada',
    ],
    correctIndex: 1,
    explanation:
        'Nunavut publishes Driver’s Licence Demerit Point Regulations. Open the consolidation. Copying NWT numbers onto Nunavut would be inventing.',
    topic: 'Points',
    appliesTo: ['NU'],
    sourceNote:
        'Nunavut Driver’s Licence Demerit Point Regulations: https://www.nunavutlegislation.ca/en/consolidated-law/drivers-licence-demerit-point-regulations-consolidation',
  ),
];

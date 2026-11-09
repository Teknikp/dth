import '../models/jurisdiction.dart';

const ontario = Jurisdiction(
  code: 'ON',
  name: 'Ontario',
  isTerritory: false,
  authority: 'Ministry of Transportation / DriveTest',
  passengerLicence: 'Class G (via G1 then G2)',
  minLearnerAge: '16',
  parentalConsent: 'Ontario’s new-driver page does not list a separate parental-consent age for a first G1. Bring original ID. If you are a minor, confirm any extra forms with DriveTest when you book.',
  stages: [
    GdlStage(
      name: 'G1 (Level One)',
      classCode: 'G1',
      duration: 'Usually 12 months. An approved driver-education course lets you take the G2 road test after 8 months. You have up to five years to finish the whole G process or you start over.',
      howToEnter: 'Be at least 16, be an Ontario resident (not a visitor), pass a vision test and a knowledge test. As of 11 May 2026 you must declare that Ontario is your primary residence and that your presence in Canada is legal.',
      restrictions: [
        'Zero blood alcohol.',
        'Every passenger must wear a working seatbelt.',
        'No driving between midnight and 5:00 a.m.',
        'No 400-series highways or listed high-speed expressways (QEW, Gardiner, Don Valley Parkway, and others named by MTO), unless the accompanying driver is a certified instructor.',
        'Accompanying driver: Class G (or higher), at least four years’ experience, BAC under 0.05 (zero if they are 21 or under). They must be the only other person in the front seat.',
      ],
      howToAdvance: 'Pass the G2 road test (G1 exit test).',
    ),
    GdlStage(
      name: 'G2 (Level Two)',
      classCode: 'G2',
      duration: 'At least 12 months.',
      howToEnter: 'Pass the G2 road test.',
      restrictions: [
        'Zero blood alcohol.',
        'Passengers limited to working seatbelts.',
        'You may drive alone, on all roads, at any hour — except extra night passenger limits if you are 19 or under.',
        'G2 drivers 19 and under: for the first six months, only one passenger aged 19 or under between midnight and 5:00 a.m. After six months the night passenger cap increases (see the Ontario G licence page). Immediate family and a qualified accompanying driver are treated differently — read the official page.',
      ],
      howToAdvance: 'Pass the full G road test.',
    ),
    GdlStage(
      name: 'Full G',
      classCode: 'G',
      duration: 'Standard Class G once you pass the second road test.',
      howToEnter: 'Pass the G road test after at least 12 months as G2.',
      restrictions: [
        'Adult Ontario rules apply, including the standard legal BAC limits for your age.',
      ],
      howToAdvance: 'Other classes (M, commercial) have their own tests.',
    ),
  ],
  knowledgeTest: KnowledgeTestInfo(
    summary: 'MTO multiple-choice test on rules and signs. Untimed until the centre closes. Available in English and French; G1 is offered in 32 languages. Results are immediate. Extra attempts are paid separately. Results are valid for one year; within that year you retry only failed sections.',
    passRule: 'At least 80% overall',
    format: 'Two or three sections (typically signs and rules of the road).',
  ),
  roadTest: 'G2 road test covers basic skills (turns, stopping, parallel park, lane changes, 3-point turn). The later G road test covers highway and more advanced skills. Book at DriveTest. Bring a safe vehicle that meets test rules.',
  medical: 'A vision test is required for a first G1. A medical report is required for certain medical conditions and for commercial classes; MTO will tell you if you need one.',
  identityDocuments: [
    'Original, valid proof of legal name and date of birth (day, month, and year). Photocopies and expired documents are not accepted.',
    'Examples listed by Ontario include a passport, Ontario Photo Card, citizenship card with photo, Secure Certificate of Indian Status, PR card, or listed immigration documents — match your status to the official list.',
  ],
  fees: [
    FeeItem(
      label: 'Class G1 licence package',
      amount: '\$159.75',
      note: 'DriveTest: knowledge test, one G2 road test, and a five-year licence, paid at application.',
    ),
    FeeItem(
      label: 'Knowledge test (extra attempt)',
      amount: '\$16.00',
      note: 'DriveTest fees page.',
    ),
    FeeItem(
      label: 'Class G2 road test (extra attempt)',
      amount: '\$53.75',
      note: 'DriveTest fees page.',
    ),
    FeeItem(
      label: 'Class G road test',
      amount: '\$91.25',
      note: 'DriveTest fees page. Not included in the G1 package.',
    ),
    FeeItem(
      label: 'Five-year licence only',
      amount: '\$90.00',
      note: 'DriveTest fees page.',
    ),
  ],
  otherClasses: [
    'Class M motorcycle has a parallel M1/M2/M process.',
    'Commercial classes (A, B, C, D, E, F) need extra knowledge, road, and often medical tests.',
  ],
  sources: [
    OfficialLink(
      label: 'Get a G driver’s licence (new drivers)',
      url: 'https://www.ontario.ca/page/get-g-drivers-licence-new-drivers',
    ),
    OfficialLink(
      label: 'DriveTest knowledge tests',
      url: 'https://drivetest.ca/tests/knowledge-tests/',
    ),
    OfficialLink(
      label: 'DriveTest fees',
      url: 'https://drivetest.ca/tests/fees/',
    ),
    OfficialLink(
      label: 'Acceptable ID',
      url: 'https://drivetest.ca/licences/acceptable-id-documents/',
    ),
  ],
  handbookUrl: 'https://www.ontario.ca/document/official-mto-drivers-handbook',
  dataDepth: DataDepth.solid,
  dataNotes: 'G2 night-passenger detail for drivers 19 and under is summarized; read the Ontario page for the six-month step-up and family exceptions.',
  lastReviewed: 'November 2026',
);

const quebec = Jurisdiction(
  code: 'QC',
  name: 'Quebec',
  isTerritory: false,
  authority: 'SAAQ',
  passengerLicence: 'Class 5 (learner, then probationary, then regular)',
  minLearnerAge: '16',
  parentalConsent: 'Written consent of a parent or legal guardian if you are under 18. Consent is reused for a limited time — SAAQ says it is valid administratively for six months from signing.',
  stages: [
    GdlStage(
      name: 'Learner’s licence',
      classCode: 'Class 5 learner',
      duration: 'At least 12 months.',
      howToEnter: 'Be 16+, live principally in Québec, have the right to stay in Canada more than six months, complete Phase 1 of a recognized driving course, pass the SAAQ vision test, file the Declaration of Illness or Impairment, and show ID.',
      restrictions: [
        'Accompanied at all times by an authorized person in the front passenger seat.',
        'No driving between midnight and 5:00 a.m.',
        'No driving after consuming alcohol or drugs.',
        'Four or more demerit points revokes the licence; you then wait three months before you may obtain a new one.',
      ],
      howToAdvance: 'Finish the recognized driving course, pass the SAAQ knowledge tests (eligible after 10 months as a learner), then pass the road test after 12 months.',
    ),
    GdlStage(
      name: 'Probationary licence',
      classCode: 'Class 5 probationary',
      duration: '24 months of valid probationary time. The licence is not renewable; you then obtain a regular licence.',
      howToEnter: 'Pass the knowledge and road tests and present the driving-school attestation of all learning phases.',
      restrictions: [
        'Zero alcohol and drugs while driving.',
        'Cannot accompany a learner.',
        'Licence revoked for four or more demerit points (then a waiting period).',
        'Holders aged 19 or under: passenger limits for other people 19 or under between midnight and 5:00 a.m. (one passenger in the first 6 months, up to three between 6 and 12 months). Immediate family is excluded from that count.',
      ],
      howToAdvance: 'Hold a valid probationary licence for 24 months, then obtain a regular Class 5.',
    ),
    GdlStage(
      name: 'Regular Class 5',
      classCode: 'Class 5',
      duration: 'Standard SAAQ driver’s licence.',
      howToEnter: 'Complete the 24-month probationary period.',
      restrictions: [
        'Adult Highway Safety Code rules apply, including Québec’s alcohol limits for your age and licence type.',
      ],
      howToAdvance: 'Other classes (motorcycle, air brakes, commercial) have extra courses and tests.',
    ),
  ],
  knowledgeTest: KnowledgeTestInfo(
    summary: 'SAAQ knowledge tests cover regulations, road signs and signals, and behaviour. Book at an SAAQ service centre. You must have held the learner’s licence at least 10 months. If you fail, SAAQ requires at least 28 days before another attempt.',
    format: 'Taken during the mandatory driving course, after Phase 1 for the learner licence and later for the full knowledge exam. Exact pass scores are set by SAAQ — confirm when you book.',
  ),
  roadTest: 'Eligible after 12 months as a learner, a passed knowledge test, and a completed driving-course attestation. Failures require at least 28 days before a retry. Bring a safe vehicle, registration, and insurance.',
  medical: 'Vision test plus the SAAQ Declaration of Illness or Impairment. SAAQ can require a medical or visual exam. Higher classes have stricter medical rules.',
  identityDocuments: [
    'Two pieces of identity from SAAQ’s accepted list.',
    'Driving-school attestation for Phase 1 (learner) and for all phases (road test).',
    'Parental consent form if you are a minor.',
  ],
  fees: [
    FeeItem(
      label:
          'Learner’s licence, knowledge test, road test, probationary licence',
      note: 'SAAQ publishes current tariffs on its site (they change with the insurance contribution). Amounts were not copied here because the English tariff table was not confirmed in this review. Check SAAQ before you pay.',
    ),
  ],
  otherClasses: [
    'Motorcycle classes 6A/6B/6C also use a probationary path.',
    'Moped (class 6D) and farm tractor (class 8) have lower minimum ages.',
    'Commercial classes need extra qualifications.',
  ],
  sources: [
    OfficialLink(
      label: 'SAAQ Class 5 eligibility',
      url: 'https://saaq.gouv.qc.ca/en/drivers-licences/obtaining-licence/passenger-vehicle-class-5/eligibility',
    ),
    OfficialLink(
      label: 'SAAQ driver’s handbook (PDF)',
      url: 'https://saaq.gouv.qc.ca/blob/saaq/documents/publications/drivers-handbook.pdf',
    ),
    OfficialLink(label: 'SAAQ home', url: 'https://saaq.gouv.qc.ca/en'),
  ],
  handbookUrl:
      'https://saaq.gouv.qc.ca/en/saaq/documents/publications/drivers-handbook',
  dataDepth: DataDepth.useful,
  dataNotes: 'Québec requires a recognized driving school for Class 5 — that is not optional. Fees are omitted until an official tariff table is confirmed.',
  lastReviewed: 'November 2026',
);

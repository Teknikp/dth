import '../models/jurisdiction.dart';

const novaScotia = Jurisdiction(
  code: 'NS',
  name: 'Nova Scotia',
  isTerritory: false,
  authority: 'Registry of Motor Vehicles / Service Nova Scotia',
  passengerLicence:
      'Class 5 (Class 7 learner, 5N newly licensed, then 5R / condition 47)',
  minLearnerAge: '16',
  parentalConsent: 'Written permission of one parent or legal guardian if you are under 18. They may later withdraw consent in writing to the Registrar, which can cancel the licence before you turn 18.',
  stages: [
    GdlStage(
      name: 'Learner',
      classCode: 'Class 7',
      duration: 'At least 12 months before a road test, or 9 months after an approved course with at least 25 hours classroom and 10 hours in-car. A learner licence issued after 1 April 2015 is valid for two years.',
      howToEnter: 'Be 16+, pass vision and two-part knowledge tests, show ID, and buy the licence. The card is marked with a large L.',
      restrictions: [
        'Zero blood alcohol.',
        'Supervising driver in the front seat who holds a regular (non-GDL) licence.',
        'No other passengers, except limited driving-school dual-control exceptions.',
        'No extra night curfew for Class 7 car learners (the supervisor must always be there). Motorcycle learners do have daylight-only rules.',
        'Four or more demerit points: six-month suspension, then the waiting period restarts.',
      ],
      howToAdvance: 'Pass the road test after the waiting period.',
    ),
    GdlStage(
      name: 'Newly licensed',
      classCode: 'Class 5N',
      duration: 'Minimum two years. You also need an approved 6-hour defensive driving course or a recognized driver-training course (25 hours theory, 10 hours driving). Without that certificate you stay in this stage indefinitely.',
      howToEnter: 'Pass the Class 5 road test.',
      restrictions: [
        'Zero blood alcohol.',
        'Only one front-seat passenger; rear passengers limited to available seat belts.',
        'No upgrade beyond Class 5.',
        'No driving midnight–5:00 a.m. unless you have a work exemption or a supervising driver.',
      ],
      howToAdvance: 'Serve at least two years, file the driving-course certificate with RMV, then move to the restricted individual stage.',
    ),
    GdlStage(
      name: 'Restricted individual (condition 47)',
      classCode: 'Class 5R',
      duration: 'Two full years.',
      howToEnter:
          'Leave the newly licensed stage with the required course on file.',
      restrictions: [
        'Zero blood alcohol (and no drugs in your body while driving).',
        'Cannot be a supervising driver for a learner or for a newly licensed driver during the night curfew.',
      ],
      howToAdvance: 'After two years as a restricted individual, GDL restrictions are removed and you are a fully experienced Class 5 driver.',
    ),
  ],
  knowledgeTest: KnowledgeTestInfo(
    summary: 'Two parts: highway signs and rules of the road. Both must be passed. If you fail one part you rewrite the entire test. Oral tests are available by appointment.',
    passRule: '16/20 on each part',
    format: '20 multiple-choice questions per part.',
  ),
  roadTest: 'Book only after you hold a valid road-test receipt. You must still have a valid learner licence on test day. The vehicle must be safe and insured.',
  medical: 'Vision must meet RMV standards (handbook and permits directory: about 20/40 or 6/12 acuity and 120° field). A medical or optical certificate is required in some cases.',
  identityDocuments: [
    'Proof of age (birth certificate, passport, NS ID card, citizenship, immigration, military, or Certificate of Indian Status, as listed by RMV).',
    'Two additional pieces of identification with your signature.',
  ],
  fees: [
    FeeItem(
      label: 'Knowledge test receipt',
      amount: '\$15.03',
      note: 'Tax included. Service Nova Scotia permits directory for a Class 7 learner’s licence.',
    ),
    FeeItem(
      label: 'Learner’s licence',
      amount: '\$25.10',
      note: 'No tax. Same permits directory. You receive a 30-day temporary, then the card in the mail.',
    ),
    FeeItem(
      label: 'Road test receipt',
      amount: '\$52.54',
      note: 'Tax included. Must be paid before you can book.',
    ),
    FeeItem(
      label: 'Driver’s handbook',
      amount: '\$9.75',
      note: 'Tax included, sold at RMV offices and some libraries.',
    ),
  ],
  otherClasses: [
    'Motorcycle uses Class LM / 5A with its own GDL timelines.',
    'Class 8 farm tractor is separate.',
  ],
  sources: [
    OfficialLink(
      label: 'Graduated driver licence system',
      url: 'https://novascotia.ca/sns/rmv/licence/gradlic.asp',
    ),
    OfficialLink(
      label: 'Learner’s (beginner’s) licence',
      url: 'https://novascotia.ca/sns/paal/rmv/paal378.asp',
    ),
    OfficialLink(
      label: 'Who takes the exam',
      url: 'https://novascotia.ca/sns/rmv/licence/appexam.asp',
    ),
  ],
  handbookUrl: 'https://novascotia.ca/sns/pdf/drivers-handbook.pdf',
  dataDepth: DataDepth.solid,
  dataNotes: 'Some older GDL PDFs mention a shorter learner wait; the current RMV graduated-licensing and permits pages say 12 months (9 with approved training). This app follows those pages.',
  lastReviewed: 'November 2026',
);

const newBrunswick = Jurisdiction(
  code: 'NB',
  name: 'New Brunswick',
  isTerritory: false,
  authority: 'Service New Brunswick / Registrar of Motor Vehicles',
  passengerLicence: 'Class 5 (via Class 7 Level 1 then Level 2)',
  minLearnerAge: '16',
  parentalConsent:
      'Applicants under 18 need parental consent witnessed by a non-relative.',
  stages: [
    GdlStage(
      name: 'Level 1',
      classCode: 'Class 7 Level 1',
      duration: 'Minimum 12 months, or 8 months after a recognized licensed driving school (green certificate).',
      howToEnter: 'Pass vision (20/40 best eye) plus written, basic, and sign tests. First-time drivers get a Class 7 Level 1 graduated licence marked with L.',
      restrictions: [
        'Zero tolerance for drugs or alcohol.',
        'Only the accompanying driver (Class 5 or better, at least 3 years’ experience) in the vehicle, in the front passenger seat.',
        'No driving between midnight and 5:00 a.m.',
      ],
      howToAdvance: 'Pass the passenger-vehicle road test.',
    ),
    GdlStage(
      name: 'Level 2',
      classCode: 'Class 7 Level 2',
      duration: 'At least 12 months. Total time in GDL is a minimum of 24 months; if you entered Level 2 early because of driver training, you spend the rest of that 24 months here.',
      howToEnter: 'Pass the Level 1 road test.',
      restrictions: [
        'Zero tolerance for drugs or alcohol.',
        'No more than three passengers, with only one in the front seat.',
        'If under 21, no driving midnight–5:00 a.m. unless with a supervising Class 5+ driver who has 3 years’ experience, or you are going to/from work or school, in an emergency, or you have Registrar permission. Work and education exemptions are automatic; other purposes need a written application.',
      ],
      howToAdvance: 'After 24 months in the program with at least 12 months in Level 2, apply for a Class 5. No extra road test is required, but the upgrade is not automatic.',
    ),
    GdlStage(
      name: 'Class 5',
      classCode: 'Class 5',
      duration: 'Standard licence after you apply at the end of GDL.',
      howToEnter: 'Complete Level 1 and 2 time and apply.',
      restrictions: ['Adult New Brunswick rules apply.'],
      howToAdvance: 'Commercial classes from 18 with medical and tests.',
    ),
  ],
  knowledgeTest: KnowledgeTestInfo(
    summary: 'Written, basic, and sign tests for Class 7 Level 1. Test results are valid for 6 months; you must finish licence issuance or upgrade within that window.',
  ),
  roadTest: 'Passenger-vehicle road test for Class 7 Level 2 (or Class 5 in some exchange cases). You must have held Level 1 for one year, or 8 months with a recognized driver-education certificate, unless you were previously fully licensed elsewhere.',
  medical: 'Vision screening for a first licence. Medical fitness reports are required for commercial classes (typically within six months, signed by a driver examiner).',
  identityDocuments: [
    'If you are not already licensed: one proof of identification and two proofs of residency.',
    'Completed consent form if under 18.',
  ],
  fees: [
    FeeItem(
      label: 'Knowledge test, road test, and Class 7/5 cards',
      note: 'Service New Brunswick’s public fee amounts were not confirmed in this review. Ask SNB or check the current tariff before you pay.',
    ),
  ],
  otherClasses: [
    'Class 8 farm tractor and Class 9 moped/scooter from age 14.',
    'Classes 1–4 from 18 with medical and road tests.',
  ],
  sources: [
    OfficialLink(
      label: 'Graduated drivers’ licences',
      url: 'https://www.gnb.ca/en/topic/driving-transportation/driving-licensing/graduated-licences.html',
    ),
    OfficialLink(
      label: 'Testing requirements (PDF)',
      url: 'https://www2.gnb.ca/content/dam/gnb/Departments/ps-sp/pdf/Services/DLRequirements.pdf',
    ),
  ],
  handbookUrl: 'https://www.gnb.ca/en/topic/driving-transportation/driving-licensing.html',
  dataDepth: DataDepth.useful,
  dataNotes: 'GDL rules are from gnb.ca. Fees are unpublished here pending an official tariff confirmation.',
  lastReviewed: 'November 2026',
);

const pei = Jurisdiction(
  code: 'PE',
  name: 'Prince Edward Island',
  isTerritory: false,
  authority: 'Access PEI / Highway Safety',
  passengerLicence:
      'Class 5 (via Class 7 instruction permit, then GDL stages 2 and 3)',
  minLearnerAge: '16',
  parentalConsent: 'Confirm the current under-18 consent process at Access PEI when you apply for the instruction permit.',
  stages: [
    GdlStage(
      name: 'Stage 1 (L)',
      classCode: 'Class 7 instruction permit',
      duration: '365 days before the road test, or 275 days if you are enrolled in a certified driver education program. The permit itself is valid for two years.',
      howToEnter: 'Apply at 16 or older for an Instruction Driver’s Permit. You receive a yellow L decal for the windshield.',
      restrictions: [
        'Supervisor has held a valid licence at least four years and sits in the front seat.',
        'Only the supervisor and that person’s immediate family may be in the vehicle.',
        'Supervisor BAC under 0.05; learner BAC must be zero.',
        'No more people than seatbelts.',
        'No hand-held phone; hands-free is permitted.',
        'If under 21, no driving 1:00 a.m.–5:00 a.m.',
      ],
      howToAdvance: 'Pass the Class 5 road test after the waiting period.',
    ),
    GdlStage(
      name: 'Stage 2 (G)',
      classCode: 'Class 5 with G decal',
      duration: '365 days. First-offence GDL breaches add a 30-day suspension; a second adds 90 days, and time in the program is extended.',
      howToEnter: 'Pass the road test. Display the G decal.',
      restrictions: [
        'Only one non-family passenger; others must be immediate family.',
        'Zero BAC.',
        'No hand-held device; hands-free permitted.',
        'If under 21, no driving 1:00 a.m.–5:00 a.m. unless accompanied by someone licensed at least four years with BAC under 0.05. Work exemptions can be requested.',
      ],
      howToAdvance: 'Complete 365 days without resetting the clock.',
    ),
    GdlStage(
      name: 'Stage 3 (G)',
      classCode: 'Class 5 with G decal',
      duration: 'Another 365 days. Minimum program time is three years, or two years plus 275 days with certified driver education.',
      howToEnter: 'Finish Stage 2.',
      restrictions: [
        'Passengers limited to available seat belts.',
        'No hand-held device; hands-free permitted.',
        'Zero BAC.',
      ],
      howToAdvance: 'After Stage 3 you receive a standard Class 5 without the GDL decal rules.',
    ),
  ],
  knowledgeTest: KnowledgeTestInfo(
    summary: 'Required for the instruction permit. Study the PEI driver’s handbook and confirm the current test format at Access PEI — the GDL booklet describes stages more fully than the test blueprint.',
  ),
  roadTest: 'After 365 days (or 275 with certified driver education) you may take the Class 5 road test to enter Stage 2.',
  medical: 'Vision screening is part of licensing. Ask Access PEI whether a medical report is required for your situation.',
  identityDocuments: [
    'See Access PEI’s “Getting an Instruction Driver’s Permit” page for the current ID list.',
  ],
  fees: [
    FeeItem(
      label: 'Instruction permit, knowledge test, Class 5 licence',
      note: 'Access PEI fee amounts were not confirmed on the GDL page reviewed. Confirm at an Access PEI office before you pay.',
    ),
  ],
  otherClasses: [
    'Motorcycle and commercial classes are listed separately by Highway Safety.',
  ],
  sources: [
    OfficialLink(
      label: 'Graduated Driver Licensing Program',
      url: 'https://www.princeedwardisland.ca/en/information/transportation-and-infrastructure/graduated-driver-licensing-program-gdl',
    ),
    OfficialLink(
      label: 'PEI driving and licensing',
      url: 'https://www.princeedwardisland.ca/en/topic/driver-licensing',
    ),
  ],
  handbookUrl: 'https://www.princeedwardisland.ca/en/information/transportation-and-infrastructure/graduated-driver-licensing-program-gdl',
  dataDepth: DataDepth.useful,
  dataNotes: 'Stage rules are from the official GDL page (updated 20 November 2024). Knowledge-test pass mark and fees were not on that page.',
  lastReviewed: 'November 2026',
);

const newfoundland = Jurisdiction(
  code: 'NL',
  name: 'Newfoundland and Labrador',
  isTerritory: false,
  authority: 'Motor Registration Division',
  passengerLicence: 'Class 5 (5I learner, then 5II novice, then Class 5)',
  minLearnerAge: '16',
  parentalConsent: 'If you are under 19 and applying for the first time, a parent or legal guardian must attend and sign consent (unless you document that you are married or self-supporting). They may withdraw consent in writing until you turn 19.',
  stages: [
    GdlStage(
      name: 'Level I learner',
      classCode: 'Class 5I',
      duration: 'At least 12 months, or 8 months with an approved driver-education program. The Class 5I licence is valid for two years from issue.',
      howToEnter: 'Be 16+, pass written and vision tests.',
      restrictions: [
        'Zero BAC for the learner. The accompanying driver must also have zero BAC.',
        'Accompanied by a licensed driver with at least four years as a Class 5 driver, in the front adjacent seat.',
        'No other passengers.',
        'No driving midnight–5:00 a.m.',
        'Display a “NOVICE DRIVER” sign on the rear (black letters at least 5 cm on a white background).',
        'Cannot upgrade to a commercial class.',
      ],
      howToAdvance: 'Pass the on-road test.',
    ),
    GdlStage(
      name: 'Level II novice',
      classCode: 'Class 5II',
      duration: '12 months.',
      howToEnter: 'Pass the road test after the Level I wait.',
      restrictions: [
        'Zero BAC.',
        'Between midnight and 5:00 a.m. you must be accompanied by a Class 5 driver with at least four years’ experience (work-hours exemption if you can prove it to a peace officer).',
        'Passengers limited to the number of seat belts.',
        'Cannot upgrade to commercial classes until you have held a full Class 5 for at least one year.',
      ],
      howToAdvance: 'After 12 months at Level II you hold a full Class 5.',
    ),
    GdlStage(
      name: 'Class 5',
      classCode: 'Class 5',
      duration: 'Standard licence after Level II.',
      howToEnter: 'Complete 12 months as Class 5II.',
      restrictions: ['Adult NL rules apply.'],
      howToAdvance:
          'Commercial classes after the extra one-year full Class 5 wait.',
    ),
  ],
  knowledgeTest: KnowledgeTestInfo(
    summary: 'Written knowledge and vision tests to enter Class 5I. Study the official Road User’s Guide.',
  ),
  roadTest: 'After 12 months as 5I, or 8 months with approved driver education. You must pass to enter Class 5II.',
  medical: 'Vision test for a first licence. Medical examinations apply to commercial classes and when Motor Registration requires them.',
  identityDocuments: [
    'Proof of name and age. Parent/guardian must show proof of guardianship when signing for an applicant under 19.',
  ],
  fees: [
    FeeItem(
      label: 'Level I licence, road test, and Class 5 card',
      note: 'Motor Registration’s fee schedule was not verified in this review. Confirm current amounts with the Division before you pay.',
    ),
  ],
  otherClasses: ['Class 6 motorcycle has a parallel novice path.'],
  sources: [
    OfficialLink(
      label: 'Graduated Driver Licencing Program',
      url: 'https://www.gov.nl.ca/motorregistration/new-drivers/graduated-driver-licencing-program/',
    ),
    OfficialLink(
      label: 'Motor Registration — new drivers',
      url: 'https://www.gov.nl.ca/motorregistration/new-drivers/',
    ),
  ],
  handbookUrl: 'https://www.gov.nl.ca/motorregistration/files/drivers-driversandvehicles-driverlicensing-road-users-guide.pdf',
  dataDepth: DataDepth.useful,
  dataNotes: 'Stage rules are from the Motor Registration GDL page. Fees are unpublished here.',
  lastReviewed: 'November 2026',
);

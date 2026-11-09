import '../models/jurisdiction.dart';

const yukon = Jurisdiction(
  code: 'YT',
  name: 'Yukon',
  isTerritory: true,
  authority: 'Yukon Motor Vehicles',
  passengerLicence: 'Class 5 (Class 7 learner, then Class 5 novice)',
  minLearnerAge: '15',
  minLearnerAgeNote: 'You must be at least 16, with 6 months as a learner and 50 logged hours, before the Class 5 road test.',
  parentalConsent: 'If you are under 18, a parent or legal guardian must come with you and show proof of identity.',
  stages: [
    GdlStage(
      name: 'Learner',
      classCode: 'Class 7',
      duration: 'Minimum 6 months, with at least 50 hours of logged practice.',
      howToEnter: 'Be 15+, show valid ID and Yukon residency, pass the written test and a vision test.',
      restrictions: [
        'Zero alcohol or drugs for you and your co-driver.',
        'Co-driver holds a Class 5 (or higher) for at least 2 years and must be with you whenever you drive.',
        'Drive only between 5:00 a.m. and midnight.',
        'Display an L sign on the back of the vehicle.',
        'Limited to 2 passengers including the co-driver, unless extras are immediate family.',
        'Everyone wears a seat belt.',
        'Cars or light trucks only, registered GVW not over 4,000 kg, seating capacity not more than 7 including the driver.',
        'No hand-held or hands-free electronic devices.',
        'No towing a trailer.',
      ],
      howToAdvance: 'At 16 or older, after 6 months and 50 logged hours, pass the Class 5 road test.',
    ),
    GdlStage(
      name: 'Novice',
      classCode: 'Class 5 novice',
      duration: 'At least 18 consecutive months without violating GDL restrictions. Violations reset the stage clock.',
      howToEnter: 'Pass the Class 5 road test (about 30 minutes).',
      restrictions: [
        'Zero alcohol or drugs.',
        'A co-driver is required between midnight and 5:00 a.m. (unless the Registrar grants a midnight exemption). The co-driver is also zero-tolerance.',
        'No electronic devices, hand-held or hands-free.',
        'Passenger vehicles only, up to 4,000 kg GVW and 9 seats including the driver.',
        'Passengers limited to seat belts; no riders in a truck box.',
      ],
      howToAdvance: 'Apply for a full-privilege Class 5 after 18 clean months as a novice.',
    ),
    GdlStage(
      name: 'Full-privilege Class 5',
      classCode: 'Class 5',
      duration: 'Standard Yukon Class 5.',
      howToEnter: 'Complete the novice stage and apply.',
      restrictions: [
        'Adult Yukon rules apply. Seven demerit points suspends a GDL licence for one month — full-privilege penalties differ.',
      ],
      howToAdvance: 'Other classes after you hold full Class 5.',
    ),
  ],
  knowledgeTest: KnowledgeTestInfo(
    summary: 'Written test at a Motor Vehicles office. Study the Yukon Driver’s Basic Handbook. If you fail, you may retry as early as the next day.',
  ),
  roadTest: 'Book at a Motor Vehicles office. Pay the road-test fee when you book. Bring a safe, registered, insured vehicle, your licence, and a valid co-driver. Class 5 tests are booked only after your practice log book has been dropped off for inspection.',
  medical: 'Vision test is required. If you do not pass, you need further testing by an optometrist or ophthalmologist. Glasses or contacts, if required, become a licence restriction.',
  identityDocuments: [
    'Valid identification and proof you are a Yukon resident.',
    'Parent/guardian ID if you are under 18.',
  ],
  fees: [
    FeeItem(
      label: 'Written knowledge test',
      amount: '\$20',
      note: 'Yukon.ca “Get a driver’s licence”. Paid again on each retry.',
    ),
    FeeItem(
      label: 'Road test',
      amount: '\$20',
      note: 'Yukon.ca “Get a driver’s licence”.',
    ),
    FeeItem(
      label: 'Licence card',
      note: 'Card-issuance amounts were not listed on the same page. Confirm at a Motor Vehicles office.',
    ),
  ],
  otherClasses: [
    'Motorcycle and commercial classes are described in the Yukon handbook after you hold Class 5.',
  ],
  sources: [
    OfficialLink(
      label: 'Get a driver’s licence',
      url: 'https://yukon.ca/en/driving-and-transportation/driver-licensing/get-drivers-licence',
    ),
    OfficialLink(
      label: 'Yukon Driver’s Basic Handbook',
      url: 'https://yukon.ca/sites/default/files/hpw-en-yukon-drivers-basic-handbook-2023-web.pdf',
    ),
  ],
  handbookUrl: 'https://yukon.ca/en/yukon-drivers-basic-handbook',
  dataDepth: DataDepth.solid,
  dataNotes: 'GDL restrictions follow Yukon.ca and Chapter 9 of the 2023 Basic Handbook.',
  lastReviewed: 'November 2026',
);

const northwestTerritories = Jurisdiction(
  code: 'NT',
  name: 'Northwest Territories',
  isTerritory: true,
  authority: 'NWT Driver and Vehicle Services',
  passengerLicence: 'Class 5 (Class 7 learner, then Class 5P, then Class 5)',
  minLearnerAge: '15',
  minLearnerAgeNote:
      'You must be at least 16 to enter the Class 5P probationary stage.',
  parentalConsent: 'Bring proof of legal name and date of birth. Confirm any extra under-18 consent form at the driver and vehicle office — first licences are in-person only.',
  stages: [
    GdlStage(
      name: 'Learner',
      classCode: 'Class 7',
      duration: 'At least one year, with no suspension.',
      howToEnter: 'Be 15+, pass vision screening and a knowledge exam.',
      restrictions: [
        'Drive only with a fully licensed supervisor who has at least 24 months on a full Class 5.',
        'No driving 11:00 p.m.–6:00 a.m.',
        'No passengers other than the supervisor.',
        'Driver and supervisor must both have zero BAC.',
        'Six or more demerit points may lead the Registrar to suspend you.',
      ],
      howToAdvance: 'At 16 or older, after a suspension-free Class 7 year, pass the practical test for Class 5P.',
    ),
    GdlStage(
      name: 'Probationary',
      classCode: 'Class 5P',
      duration: '12 months suspension-free. The upgrade to full Class 5 is not automatic.',
      howToEnter: 'Be 16+, finish Class 7 without a suspension, and pass the practical exam.',
      restrictions: [
        'Cannot upgrade to commercial Class 1–4 during this year.',
        'Impaired-driving conviction or six or more demerit points suspends the licence.',
      ],
      howToAdvance: 'Visit a driver and vehicle office in person to upgrade to full Class 5 or 6.',
    ),
    GdlStage(
      name: 'Full Class 5',
      classCode: 'Class 5',
      duration: 'Standard NWT licence after you apply.',
      howToEnter:
          'Complete 12 suspension-free months as 5P and apply in person.',
      restrictions: ['Adult NWT rules apply.'],
      howToAdvance: 'Commercial classes after you hold full Class 5 and meet medical rules.',
    ),
  ],
  knowledgeTest: KnowledgeTestInfo(
    summary: 'Book a written exam at a driver and vehicle office. Photo ID is required. Study the NWT driver manual.',
  ),
  roadTest: 'A practical exam is required to move from Class 7 to Class 5P. Book, cancel, or rebook through Driver and Vehicle Services.',
  medical: 'Vision screening for a first licence. NWT publishes separate medical-requirement pages for commercial and some other classes.',
  identityDocuments: [
    'Proof of legal name, date of birth, and acceptable photo ID (birth certificate, passport, etc.).',
    'Proof of NWT residency (utility bill, residential lease, etc.).',
    'Completed application form.',
  ],
  fees: [
    FeeItem(
      label: '5-year new licence',
      amount: '\$110 (seniors 60+: \$54)',
      note: 'From the NWT “Get a driver’s licence for the first time” page. That page currently also lists a second, slightly lower schedule. Confirm the amount in force when you apply.',
    ),
    FeeItem(
      label: '3-year new licence',
      amount: '\$84 (seniors 60+: \$43)',
      note: 'Same NWT page; confirm on the day you apply.',
    ),
    FeeItem(
      label: '1-year new licence',
      amount: '\$46 (seniors 60+: \$23)',
      note: 'Same NWT page; confirm on the day you apply.',
    ),
    FeeItem(
      label: 'Knowledge and road tests',
      note: 'Written and practical exam fees were not listed on the first-licence page. Ask the office when you book.',
    ),
  ],
  otherClasses: [
    'Class 6 motorcycle uses Class 6P in parallel.',
    'Classes 1–4 after full Class 5, with medical and Entry Level Training where required.',
  ],
  sources: [
    OfficialLink(
      label: 'Get a driver’s licence for the first time',
      url: 'https://www.idmv.inf.gov.nt.ca/Drivers/Drivers/Get-a-drivers-licence-for-the-first-time',
    ),
    OfficialLink(
      label: 'NWT driver manuals',
      url: 'https://www.idmv.inf.gov.nt.ca/Drivers/Drivers/Driver-manuals',
    ),
  ],
  handbookUrl: 'https://www.idmv.inf.gov.nt.ca/Drivers/Drivers/Driver-manuals',
  dataDepth: DataDepth.useful,
  dataNotes: 'GDL stages are from the official first-licence page. That page lists two licence-card fee schedules — amounts here need a same-day check. Exam fees were not published there.',
  lastReviewed: 'November 2026',
);

const nunavut = Jurisdiction(
  code: 'NU',
  name: 'Nunavut',
  isTerritory: true,
  authority: 'Nunavut Motor Vehicles',
  passengerLicence: 'Class 5 (Class 7 learner, then Class 5)',
  minLearnerAge: '15',
  minLearnerAgeNote: 'Class 5 and 6 require you to be at least 16 and to hold a valid learner’s licence.',
  parentalConsent: 'Confirm the current under-18 process at your local Motor Vehicle service provider. Applications are in person.',
  stages: [
    GdlStage(
      name: 'Learner',
      classCode: 'Class 7',
      duration: 'Nunavut does not publish a multi-year GDL timetable like most provinces. The Driver’s Licence Regulations require a qualified accompanying driver. The restricted driver manual says a first-time driver must practise at least four weeks before the Class 5 or 6 road test.',
      howToEnter: 'Be 15+, pass a written knowledge test and vision standard, and show suitable identification.',
      restrictions: [
        'You must be accompanied by a person licensed for that vehicle type. For Class 5, the accompanying driver needs at least two years’ experience (three years if they hold Class 1–4 for that vehicle type). They must instruct you.',
        'Motorcycle learners have extra night and speed-zone limits in the regulations.',
      ],
      howToAdvance: 'At 16, with a valid learner licence, pass written knowledge tests (if still required), vision standards, and a road test.',
    ),
    GdlStage(
      name: 'Class 5',
      classCode: 'Class 5',
      duration: 'Standard Class 5. No separate published novice/intermediate card stage was found on the current Motor Vehicles pages.',
      howToEnter:
          'Age 16, valid learner’s licence, knowledge, vision, and road test.',
      restrictions: [
        'Adult Nunavut rules apply.',
        'A driver’s medical is required at age 75, at age 80, and every two years after 80 for Class 5, 6, or 7.',
      ],
      howToAdvance: 'Classes 1–4 from age 18 with a Class 5, medical, knowledge, vision, pre-trip, and road test.',
    ),
  ],
  knowledgeTest: KnowledgeTestInfo(
    summary: 'Written knowledge test for Class 7, and again as required for Class 5/6. Study the Nunavut Driver’s Manual. An interpreter may be allowed at the examiner’s discretion.',
  ),
  roadTest: 'Required for Class 5 and 6. First-time drivers need at least four weeks of practice on a learner permit. After a failed attempt, practise at least two weeks (later fails: the examiner sets the wait). Bring insurance, registration, a plate, and a safe, clean vehicle of the right class.',
  medical: 'Vision standards for Class 5, 6, and 7 (acuity, colour, field). Corrective lenses become a licence endorsement if you need them. Commercial classes need a driver’s medical. Age-based medicals start at 75 for Class 5–7.',
  identityDocuments: [
    'Completed application / remittance slip.',
    'Two pieces of acceptable ID (the Motor Vehicles page lists examples such as passport, current licence, birth certificate, citizenship, Nunavut ID, health card, and others).',
  ],
  fees: [
    FeeItem(
      label: 'Application, tests, and licence card',
      note: 'Nunavut’s Motor Vehicles pages reviewed for this app do not publish a current public fee table. Ask your local Motor Vehicle service provider.',
    ),
  ],
  otherClasses: [
    'Class 6 motorcycle; Class 1–4 commercial from 18.',
    'New residents must apply within 30 days of moving to Nunavut. A licence expired more than 12 months usually means an examination.',
  ],
  sources: [
    OfficialLink(
      label: 'Apply for a driver’s licence',
      url: 'https://www.gov.nu.ca/en/service-nunavut/apply-drivers-licence',
    ),
    OfficialLink(
      label: 'Nunavut Driver’s Manual (PDF)',
      url: 'https://www.gov.nu.ca/sites/default/files/documents/2022-12/driversmanual_eng.pdf',
    ),
    OfficialLink(
      label: 'Driver’s Licence Regulations',
      url: 'https://www.nunavutlegislation.ca/en/consolidated-law/drivers-licence-regulations',
    ),
  ],
  handbookUrl: 'https://www.gov.nu.ca/sites/default/files/documents/2022-12/driversmanual_eng.pdf',
  dataDepth: DataDepth.thin,
  dataNotes: 'Thinnest official GDL picture of the 13 jurisdictions: there is no published L/N-style multi-year program. Holding periods beyond the four-week practice note and accompanying-driver rules come from an older manual and the regulations. Fees are unpublished. Treat everything here as a pointer to Motor Vehicles, not a complete checklist.',
  lastReviewed: 'November 2026',
);

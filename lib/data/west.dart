import '../models/jurisdiction.dart';

const britishColumbia = Jurisdiction(
  code: 'BC',
  name: 'British Columbia',
  isTerritory: false,
  authority: 'ICBC',
  passengerLicence: 'Class 5 (via Class 7 L then N)',
  minLearnerAge: '16',
  parentalConsent: 'A parent or legal guardian must consent if you are under 18. ICBC also asks for a signed consent form if you are under 19 when you pick up your licence after an online knowledge test.',
  stages: [
    GdlStage(
      name: 'Learner (L)',
      classCode: 'Class 7L',
      duration: 'At least 12 months if you are under 25, or 9 months if you are 25 or older.',
      howToEnter: 'Be at least 16, pass the ICBC knowledge test and a vision screening, and show accepted ID. Under 18 needs parent/guardian consent.',
      restrictions: [
        'Display an L sign.',
        'A qualified supervisor (22 or older, and not themselves under a 0 BAC/BDC restriction) must sit with you.',
        'Zero blood alcohol content and zero blood drug concentration.',
        'No hand-held or hands-free electronic devices.',
        'Passenger limit of one, with an immediate-family exemption.',
        'Restricted hours apply (see the ICBC GLP pages).',
        'ICBC recommends logging at least 60 hours of practice.',
      ],
      howToAdvance:
          'Pass the Class 7 road test after the minimum learner time.',
    ),
    GdlStage(
      name: 'Novice (N)',
      classCode: 'Class 7',
      duration: 'At least 24 consecutive months of safe driving if under 25 (18 months if you completed an ICBC-approved GLP course during the learner stage), or 12 months if 25 or older.',
      howToEnter: 'Pass the Class 7 road test.',
      restrictions: [
        'Display an N sign (passenger and N-sign rules drop once you turn 25).',
        'Zero BAC and zero BDC.',
        'No hand-held or hands-free electronic devices.',
        'Under 25: one passenger (immediate family exempt) unless a qualified supervisor aged 22+ is with you.',
        'No prohibitions, and no convictions for electronic-device use or excessive speeding, to stay eligible to upgrade.',
      ],
      howToAdvance: 'As of 19 October 2026, a clean-record novice upgrades through a Driving Record Assessment at an ICBC driver licensing office instead of a second road test. A Class 5 licence then carries 0 BAC/BDC for 12 months.',
    ),
    GdlStage(
      name: 'Class 5 with restrictions, then full Class 5',
      classCode: 'Class 5',
      duration: '12 extra months of 0 BAC/BDC after the Driving Record Assessment. That clock resets if you receive a prohibition or suspension.',
      howToEnter: 'Meet the novice time and clean-record rules, then complete the Driving Record Assessment.',
      restrictions: ['Zero BAC/BDC for 12 months after upgrading.'],
      howToAdvance: 'After the 12-month restricted Class 5 period, ICBC issues a full-privilege Class 5 if you remain eligible.',
    ),
  ],
  knowledgeTest: KnowledgeTestInfo(
    summary: 'Multiple-choice ICBC knowledge test for Class 5/7, available online or in person. Passing the test does not licence you to drive until ICBC issues a licence at an office.',
    format: 'Online: 45 minutes in one sitting, webcam required, results valid for one year. You must still attend an office for vision screening and the licence card.',
  ),
  roadTest: 'Class 7 road test after the learner waiting period. Book only through ICBC. Bring accepted ID and a safe, insured vehicle. As of 19 October 2026, a second (Class 5) road test is not required for clean-record novices; they complete a Driving Record Assessment instead.',
  medical: 'Vision screening is required when the licence is issued. ICBC may require further medical information if your health affects driving. Commercial classes have separate medical rules.',
  identityDocuments: [
    'Two pieces of accepted ID (see ICBC’s accepted ID list).',
    'The same primary ID used to register for an online knowledge test, if you wrote it online.',
    'Proof you are a B.C. resident — ICBC will not issue a B.C. licence to non-residents.',
  ],
  fees: [
    FeeItem(
      label: 'Knowledge test',
      amount: '\$15',
      note: 'ICBC states a \$15 fee for the online knowledge test (credit card). Confirm the in-person fee on ICBC’s Fees page when you book.',
    ),
    FeeItem(
      label: 'Licence card and road tests',
      note: 'Pay the licence fee at the driver licensing office after you pass the knowledge test. Road-test fees are paid when you arrive. ICBC’s Fees page did not list dollar amounts in the version reviewed for this app — confirm current prices before you go.',
    ),
  ],
  otherClasses: [
    'Class 8 / 6 motorcycle through a parallel GLP.',
    'Commercial classes 1–4 after you hold a full Class 5 and meet medical and testing rules.',
  ],
  sources: [
    OfficialLink(
      label: 'ICBC graduated licensing',
      url: 'https://icbc.com/driver-licensing/new-drivers/Graduated-licensing',
    ),
    OfficialLink(
      label: 'GLP changes (Driving Record Assessment)',
      url: 'https://icbc.com/driver-licensing/new-drivers/graduated-licensing-program-changes',
    ),
    OfficialLink(
      label: 'Online knowledge test',
      url: 'https://www.icbc.com/driver-licensing/new-drivers/online-knowledge-test',
    ),
    OfficialLink(
      label: 'ICBC fees',
      url: 'https://icbc.com/driver-licensing/visit-dl-office/Fees',
    ),
  ],
  handbookUrl: 'https://www.icbc.com/driver-licensing/driving-guides/Learn-to-drive-smart',
  dataDepth: DataDepth.solid,
  dataNotes: 'GDL stages follow current ICBC pages, including the October 2026 Driving Record Assessment change. Road-test and card fees are not quoted here because ICBC’s Fees page did not publish amounts in the review snapshot.',
  lastReviewed: 'November 2026',
);

const alberta = Jurisdiction(
  code: 'AB',
  name: 'Alberta',
  isTerritory: false,
  authority: 'Alberta Transportation and registry agents',
  passengerLicence: 'Class 5 (via Class 7 then Class 5-GDL)',
  minLearnerAge: '14',
  minLearnerAgeNote: 'You must be at least 16 to take the Class 5-GDL road test. A full non-GDL Class 5 requires you to be at least 18.',
  parentalConsent:
      'Parental or guardian consent is required if you are under 18.',
  stages: [
    GdlStage(
      name: 'Learner',
      classCode: 'Class 7',
      duration: 'At least 12 months before you may take the Class 5 road test.',
      howToEnter: 'Be 14 or older, pass a knowledge test and vision test at a registry agent, and buy the licence card.',
      restrictions: [
        'Drive Class 5 or 6 vehicles only with a supervising driver over 18 who holds a full Class 5 (they sit in the front passenger seat). You may ride a moped alone.',
        'No driving between midnight and 5:00 a.m.',
        'Zero alcohol when driving.',
        'No more people than seat belts.',
        'Licence is suspended at 8 demerit points.',
      ],
      howToAdvance: 'At 16 or older, after 12 months as Class 7, pass the Class 5 road test and a vision test.',
    ),
    GdlStage(
      name: 'Probationary GDL',
      classCode: 'Class 5-GDL',
      duration: '24 months of probationary driving. An approved Class 5 or 6 driver-training program can shorten this by up to 6 months. You must be suspension- and demerit-free for the last 12 months to exit.',
      howToEnter:
          'Pass the Class 5 road test and vision test, then purchase the card.',
      restrictions: [
        'Zero drug or alcohol level when driving.',
        'No more people than seat belts.',
        'Suspended at 8 demerit points.',
        'Cannot supervise a learner.',
        'Cannot upgrade to Class 1–4.',
      ],
      howToAdvance: 'From April 2023, Alberta no longer requires an advanced road test to leave GDL. Meet the time, age (18+), and clean-record rules, then apply at a registry.',
    ),
    GdlStage(
      name: 'Full Class 5',
      classCode: 'Class 5',
      duration: 'Standard operator licence once GDL is complete.',
      howToEnter: 'Be at least 18, finish the probationary period (including the last 12 months demerit- and suspension-free), and meet residency/ID rules.',
      restrictions: [
        'Adult alcohol and demerit rules apply (not the GDL 8-point / zero-alcohol set).',
      ],
      howToAdvance:
          'You may later upgrade to commercial classes if you qualify.',
    ),
  ],
  knowledgeTest: KnowledgeTestInfo(
    summary: 'Taken at a registry agent. Required before a Class 7 (and for other classes and endorsements). You may attempt it once per day, and you pay each attempt.',
    passRule: '25 out of 30',
    format: '30 multiple-choice questions.',
  ),
  roadTest: 'Book a Class 5 road test through a registry agent or the Alberta Road Test Scheduler. You fail a Class 5/6 test with more than 75 demerit points on the exam. The vehicle must meet legal and safety requirements.',
  medical: 'Vision is tested at the registry. The agent may also ask for a medical report from your doctor. Commercial classes have extra medical standards.',
  identityDocuments: [
    'Acceptable ID plus proof you live in Alberta and in Canada.',
    'You must be a Canadian citizen, permanent resident, hold a valid work or student visa, or have an approved refugee claim (see Alberta’s residency and ID page for the current list).',
  ],
  fees: [
    FeeItem(
      label: 'Knowledge test (all classes)',
      amount: '\$5 government fee + up to \$12.60 registry service charge',
      note: 'From the Alberta Registry Agent Product Catalogue effective 1 September 2026. Agents cannot charge more than the capped service charge.',
    ),
    FeeItem(
      label: 'Operator licence card (government fee)',
      amount: '\$17 per year of validity (e.g. \$85 for 5 years)',
      note: 'Plus a capped registry service charge (\$10.50–\$13.65 depending on term). Seniors’ discount may apply. Confirm at your registry.',
    ),
    FeeItem(
      label: 'Class 5 road test',
      note: 'Alberta.ca says registry agents set and publish their own road-test price. Do not assume a provincial flat fee — ask the agent when you book.',
    ),
  ],
  otherClasses: [
    'Class 6 motorcycle.',
    'Classes 1–4 commercial after you hold a full (non-GDL) Class 5 and pass medical and tests.',
  ],
  sources: [
    OfficialLink(
      label: 'Steps to getting a driver’s licence',
      url: 'https://www.alberta.ca/get-drivers-licence-steps',
    ),
    OfficialLink(
      label: 'Class 7 learner’s licence',
      url: 'https://www.alberta.ca/class-7-learners-licence',
    ),
    OfficialLink(
      label: 'Class 5 driver’s licence',
      url: 'https://www.alberta.ca/class-5-drivers-licence',
    ),
    OfficialLink(
      label: 'Knowledge test',
      url: 'https://www.alberta.ca/drivers-knowledge-test',
    ),
    OfficialLink(
      label: 'Registry Agent Product Catalogue (fees)',
      url: 'https://open.alberta.ca/publications/registry-agent-product-catalogue',
    ),
  ],
  handbookUrl:
      'https://www.alberta.ca/driver-guides-to-operation-safety-and-licensing',
  dataDepth: DataDepth.solid,
  dataNotes: 'Road-test dollar amounts are left blank on purpose: Alberta lets registry agents set them.',
  lastReviewed: 'November 2026',
);

const saskatchewan = Jurisdiction(
  code: 'SK',
  name: 'Saskatchewan',
  isTerritory: false,
  authority: 'SGI',
  passengerLicence: 'Class 5 (via Class 7 learner, then Novice 1 and 2)',
  minLearnerAge: '16',
  minLearnerAgeNote: 'Age 15 is allowed if you are enrolled in or have completed the high school driver training program.',
  parentalConsent: 'If you are under 18 and have never held a licence, one parent must give written consent.',
  stages: [
    GdlStage(
      name: 'Learner',
      classCode: 'Class 7',
      duration: 'At least nine months of valid Class 7 time (interruptions such as suspension do not count).',
      howToEnter: 'Pass vision, sign, and written/oral tests and buy the licence at a motor licence issuer. High-school students may start at 15.',
      restrictions: [
        'A supervising experienced licensed driver must sit in the front passenger seat at all hours.',
        'Between midnight and 5:00 a.m., passengers must be immediate family.',
        'Passengers limited to the number of seat belts.',
        'No hand-held or hands-free cellphone.',
        'Cannot operate a right-hand-drive vehicle.',
        'Cannot be a supervising driver or obtain a commercial licence/school-bus endorsement.',
      ],
      howToAdvance: 'Complete mandatory driver education, hold Class 7 for nine months, pass the Class 5 road test, then upgrade the card at an issuer.',
    ),
    GdlStage(
      name: 'Novice 1',
      classCode: 'Class 5 Novice 1',
      duration: 'Six months of valid time.',
      howToEnter: 'Pass the Class 5 road test and update the licence class.',
      restrictions: [
        'Only one passenger who is not an immediate family member; other passengers must be immediate family, limited to seat belts.',
        'Cannot use any cellphone (hand-held or hands-free).',
        'Cannot be a supervising driver or obtain a commercial licence.',
      ],
      howToAdvance: 'Time in Novice 1, then move to Novice 2.',
    ),
    GdlStage(
      name: 'Novice 2',
      classCode: 'Class 5 Novice 2',
      duration: '12 months incident-free (no at-fault collision, traffic conviction, or suspension). An incident restarts the 12 months.',
      howToEnter: 'Finish Novice 1.',
      restrictions: [
        'Still cannot be a supervising driver or obtain a commercial licence during GDL.',
        'Cellphone restriction continues while you are a novice (confirm current SGI handbook wording).',
      ],
      howToAdvance: 'Graduate to an experienced Class 5 licence.',
    ),
  ],
  knowledgeTest: KnowledgeTestInfo(
    summary: 'Class 7 uses Basic and Sign knowledge tests. You may write only once per day. If you fail a part, you rewrite only the failed part. Passing results are valid for one year.',
    format: 'Two parts: driving situations/rules, and sign identification.',
  ),
  roadTest: 'After nine months as Class 7 and mandatory training (high school 30 hours in-class + 6 in-car, or 6 hours in-class + 6 in-car with an SGI-certified instructor). You supply the vehicle. Upgrade the class at an issuer before driving alone — exam results alone are not enough.',
  medical: 'File a medical report whenever SGI requests one. Vision standards apply to all classes.',
  identityDocuments: [
    'Original proof of full name and date of birth (birth certificate, passport, or immigration documents).',
    'A signature document acceptable to SGI (for example a Saskatchewan health card, passport, or Canadian licence).',
    'First-time drivers aged 15–18 need the parent/guardian signature form.',
  ],
  fees: [
    FeeItem(
      label: 'Knowledge test, road test, and licence card',
      note: 'SGI’s public fee table was not confirmed in the pages reviewed for this app. Ask a motor licence issuer, or check SGI’s current fee list, before you pay.',
    ),
  ],
  otherClasses: [
    'Motorcycle and commercial classes after you leave novice status and meet SGI rules.',
  ],
  sources: [
    OfficialLink(
      label: 'SGI Graduated Driver Licensing',
      url: 'https://sgi.sk.ca/handbook/-/knowledge_base/drivers/graduated-driver-licensing-program',
    ),
    OfficialLink(
      label: 'Mandatory driver education',
      url: 'https://sgi.sk.ca/handbook/-/knowledge_base/drivers/mandatory-driver-education',
    ),
    OfficialLink(
      label: 'Your test',
      url: 'https://sgi.sk.ca/handbook/-/knowledge_base/drivers/your-test',
    ),
  ],
  handbookUrl: 'https://sgi.sk.ca/handbook',
  dataDepth: DataDepth.useful,
  dataNotes: 'GDL structure is from SGI’s handbook. Test and card fees are unpublished here because SGI’s fee page was not verified in this review.',
  lastReviewed: 'November 2026',
);

const manitoba = Jurisdiction(
  code: 'MB',
  name: 'Manitoba',
  isTerritory: false,
  authority: 'Manitoba Public Insurance (MPI)',
  passengerLicence: 'Class 5 (Learner, Intermediate, then Full)',
  minLearnerAge: '16',
  minLearnerAgeNote: '15 years 6 months if you are enrolled in MPI’s high school Driver Z program that is currently in progress.',
  parentalConsent: 'Parent or legal guardian consent if you are under 18.',
  stages: [
    GdlStage(
      name: 'Learner',
      classCode: 'Class 5L',
      duration: 'Minimum nine months of valid licence time (suspension, prohibition, or expiry does not count).',
      howToEnter: 'Register as an MPI customer, pass the knowledge test, and meet vision and medical standards.',
      restrictions: [
        'Zero drugs or alcohol in your system while driving.',
        'Supervising driver must be the only front-seat passenger, hold a full Class 5 for at least 36 months, be under 0.05 BAC, and be able to pass a drug screen.',
        'Rear passengers limited to working seat belts.',
        'No towing, no Class 3 farm truck, no ORVs along or across a highway (unless you already hold Class 6 intermediate).',
      ],
      howToAdvance:
          'Pass the Class 5 road test. If you fail, wait at least 14 days.',
    ),
    GdlStage(
      name: 'Intermediate',
      classCode: 'Class 5I',
      duration: 'Minimum 15 months of valid time. You only complete this stage once (Class 5 and 6 share credit).',
      howToEnter: 'Pass the Class 5 road test.',
      restrictions: [
        'Zero drugs or alcohol.',
        '5 a.m. to midnight: one passenger in front, rear limited to working seat belts.',
        'Midnight to 5 a.m.: either one passenger, or a qualified supervisor in front plus rear passengers up to the seat-belt count.',
      ],
      howToAdvance: 'Graduate automatically to Class 5 Full after 15 months.',
    ),
    GdlStage(
      name: 'Full (first three years)',
      classCode: 'Class 5F',
      duration: 'The first three years of a Full licence still carry a zero-alcohol and drug-screening rule for drivers who entered GDL after 16 December 2006.',
      howToEnter: 'Complete the Intermediate stage.',
      restrictions: [
        'Zero alcohol for the first three years in Full stage (for drivers in the modern GDL program).',
        'You may supervise learners only after three years in Full stage.',
      ],
      howToAdvance: 'After three years in Full stage, the extra zero-alcohol GDL rule ends.',
    ),
  ],
  knowledgeTest: KnowledgeTestInfo(
    summary: 'Not open-book. If you fail, wait at least seven days before another attempt. Driver-education students under 16 need a completed driver-education form.',
  ),
  roadTest: 'Class 5 road test to leave the learner stage. Failures require a 14-day wait. Bring a safe vehicle that meets MPI’s test rules.',
  medical: 'You must meet vision and medical standards when you apply. Higher classes have extra medical rules.',
  identityDocuments: [
    'Register with MPI (often through an Autopac agent) and present identification documents they accept.',
  ],
  fees: [
    FeeItem(
      label: 'Knowledge test',
      amount: '\$12',
      note: 'MPI licensing fees page. Drivers 65+ and some retests requested by Driver Fitness are exempt.',
    ),
    FeeItem(
      label: 'Class 5 or 6 road test',
      amount: '\$35',
      note: 'MPI licensing fees page.',
    ),
    FeeItem(
      label: 'Driver’s licence charge / base premium / licence',
      amount: '\$20 / \$55 / \$12',
      note: 'MPI lists a driver’s licence charge, a base driver premium (may be prorated), and a \$12 licence amount. Confirm what applies to a first learner card when you apply.',
    ),
  ],
  otherClasses: [
    'Class 6 motorcycle has its own GDL stages.',
    'Classes 1–4 after Full stage, age, medical, and tests.',
  ],
  sources: [
    OfficialLink(
      label: 'MPI graduated driver licensing',
      url: 'https://www.mpi.mb.ca/graduated-driver-licensing/',
    ),
    OfficialLink(
      label: 'Get a Class 5 licence',
      url: 'https://www.mpi.mb.ca/get-a-passenger-vehicle-class-5-licence/',
    ),
    OfficialLink(
      label: 'Licensing fees',
      url: 'https://www.mpi.mb.ca/licensing-fees-and-other-charges/',
    ),
  ],
  handbookUrl: 'https://apps.mpi.mb.ca/comms/drivershandbook/',
  dataDepth: DataDepth.solid,
  dataNotes: 'Fees and GDL stages are from MPI’s current public pages.',
  lastReviewed: 'November 2026',
);

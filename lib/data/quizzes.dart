import 'dart:math';

import '../models/quiz.dart';

const List<PracticeQuestion> allQuestions = [
  PracticeQuestion(
    id: 'sign-stop',
    prompt: 'What must you do at a red octagonal sign?',
    choices: [
      'Slow down and proceed if the way looks clear',
      'Come to a complete stop, then go only when it is safe',
      'Stop only if other vehicles are present',
      'Yield, but a rolling stop is allowed at night',
    ],
    correctIndex: 1,
    explanation: 'The red octagon is the stop sign used across Canada. Come to a full stop before the stop line or crosswalk, look, and proceed only when it is safe and your turn.',
    topic: 'Signs',
  ),
  PracticeQuestion(
    id: 'sign-yield',
    prompt: 'An inverted red-and-white triangle typically means:',
    choices: [
      'Stop, then proceed',
      'School zone ahead',
      'Yield the right-of-way',
      'Do not enter',
    ],
    correctIndex: 2,
    explanation: 'The downward-pointing triangle is the yield sign. Slow down, be ready to stop, and give way to traffic and pedestrians that have the right-of-way.',
    topic: 'Signs',
  ),
  PracticeQuestion(
    id: 'sign-warning',
    prompt: 'A diamond-shaped sign with a yellow background usually:',
    choices: [
      'Gives a regulation you must obey, such as a speed limit',
      'Warns of a hazard or change in the road ahead',
      'Marks a recreation area',
      'Indicates a hospital',
    ],
    correctIndex: 1,
    explanation: 'Yellow diamonds are warning signs (curve, intersection, slippery when wet, and similar). They do not replace a stop or speed-limit sign; they tell you to prepare.',
    topic: 'Signs',
  ),
  PracticeQuestion(
    id: 'sign-do-not-enter',
    prompt: 'A red circle with a white horizontal bar means:',
    choices: [
      'Do not enter',
      'No stopping',
      'Railway crossing',
      'Road narrows',
    ],
    correctIndex: 0,
    explanation: 'That is the do-not-enter / wrong-way sign. You must not drive into that roadway — often used at exit ramps and one-way streets.',
    topic: 'Signs',
  ),
  PracticeQuestion(
    id: 'sign-flashing-red',
    prompt: 'A flashing red traffic light means:',
    choices: [
      'The same as a green light if the intersection looks empty',
      'Slow to 20 km/h and proceed',
      'Treat it as a stop sign: stop, then go when safe',
      'Stop and wait until it turns green',
    ],
    correctIndex: 2,
    explanation: 'Handbooks treat a flashing red like a stop sign. Stop fully, yield, then proceed when it is safe. A steady red is different: you wait for green (right-turn-on-red rules vary and are not always allowed).',
    topic: 'Signs',
  ),
  PracticeQuestion(
    id: 'sign-flashing-yellow',
    prompt: 'A flashing yellow traffic light means:',
    choices: [
      'Stop as you would for a stop sign',
      'Proceed with caution through the intersection',
      'The light is out of service; U-turn only',
      'Speed up to clear the intersection',
    ],
    correctIndex: 1,
    explanation: 'Flashing yellow means slow down, look, and proceed with caution. You do not have a free pass — yield to anyone already in, or about to enter, the intersection who has the right-of-way.',
    topic: 'Signs',
  ),
  PracticeQuestion(
    id: 'sign-school',
    prompt: 'A fluorescent yellow-green pentagon typically marks:',
    choices: [
      'A playground or school area / school crossing',
      'A hospital',
      'A construction zone',
      'A provincial park',
    ],
    correctIndex: 0,
    explanation: 'That pentagon is the school / school-crossing warning used in the Manual of Uniform Traffic Control Devices for Canada. Reduce speed and watch for children. Posted school-zone speed limits are a separate regulatory sign.',
    topic: 'Signs',
  ),
  PracticeQuestion(
    id: 'sign-rail',
    prompt: 'At a railway crossbuck (X-shaped) sign without gates, you should:',
    choices: [
      'Slow slightly and keep going; trains will honk',
      'Stop only if you can see a train',
      'Look, listen, and stop if a train is approaching or the signals require it',
      'Shift to a lower gear and cross quickly without looking',
    ],
    correctIndex: 2,
    explanation: 'Treat every crossing as active. If lights, bells, or a flagger say stop — stop. Never go around lowered gates. Trains cannot stop quickly.',
    topic: 'Signs',
  ),
  PracticeQuestion(
    id: 'sign-solid-yellow',
    prompt:
        'A solid yellow line on your side of the centre line generally means:',
    choices: [
      'Passing is allowed if you honk first',
      'Passing is not allowed on your side',
      'The lane is reserved for bicycles',
      'You must drive at least 20 km/h below the limit',
    ],
    correctIndex: 1,
    explanation: 'A solid yellow line on your side means do not pass. Broken yellow usually means passing is allowed if the way is clear. Always check local markings and oncoming traffic.',
    topic: 'Signs',
  ),
  PracticeQuestion(
    id: 'sign-speed-regulatory',
    prompt: 'A white rectangular sign with a black speed number is:',
    choices: [
      'A suggested speed for good weather only',
      'A regulatory speed limit you must obey unless a lower safe speed is required',
      'The minimum speed on that road',
      'Advice for heavy trucks only',
    ],
    correctIndex: 1,
    explanation: 'Posted speed-limit signs are regulatory. Weather, visibility, and traffic can still require you to go slower. Default urban/rural limits differ by province — do not memorize one national default.',
    topic: 'Signs',
  ),
  PracticeQuestion(
    id: 'rules-seatbelt',
    prompt: 'Who must wear a seatbelt in a passenger vehicle (where belts are fitted)?',
    choices: [
      'Only the driver',
      'Only passengers under 16',
      'The driver and all passengers, as required by provincial/territorial law',
      'Only people in the front seats',
    ],
    correctIndex: 2,
    explanation: 'Every Canadian province and territory requires seatbelts to be used when they are available. Drivers are typically responsible for young passengers. Child seats have extra rules — check your handbook.',
    topic: 'Rules',
  ),
  PracticeQuestion(
    id: 'rules-four-way',
    prompt: 'At a four-way stop, the usual right-of-way rule is:',
    choices: [
      'The largest vehicle goes first',
      'The vehicle that arrived first goes first; if you arrive together, yield to the right',
      'Traffic going north–south always goes first',
      'Whoever flashes headlights has the right-of-way',
    ],
    correctIndex: 1,
    explanation: 'Handbooks teach: first to stop, first to go; when two vehicles arrive at the same time, yield to the driver on your right. Make eye contact and do not assume the other driver will move.',
    topic: 'Rules',
  ),
  PracticeQuestion(
    id: 'rules-school-bus',
    prompt: 'When a school bus has its red lights flashing and stop arm out, you must:',
    choices: [
      'Slow to 30 km/h and pass carefully',
      'Stop (from both directions on an undivided road) until the lights stop and the arm is in',
      'Pass if you are on the opposite side of any painted centre line',
      'Honk to let the driver know you see the children',
    ],
    correctIndex: 1,
    explanation: 'On an undivided road you stop from both directions. Divided highways with a physical median are treated differently in some jurisdictions — know your local rule, but never pass a bus with its stop arm out on an undivided road.',
    topic: 'Rules',
  ),
  PracticeQuestion(
    id: 'rules-emergency',
    prompt: 'When an emergency vehicle approaches with lights and siren, you should:',
    choices: [
      'Stop immediately in the travel lane',
      'Speed up to get out of the way, then continue at speed',
      'Signal, pull as far right as you safely can, and stop until it has passed',
      'Follow it closely so you can use its path',
    ],
    correctIndex: 2,
    explanation: 'Clear a path. Pull to the right and stop. Do not block intersections. Stay stopped until the vehicle has passed and it is safe to move. Many places also require you to slow and move over for stopped emergency or tow vehicles.',
    topic: 'Rules',
  ),
  PracticeQuestion(
    id: 'rules-following',
    prompt:
        'A commonly taught minimum following distance in good conditions is:',
    choices: [
      'About one car length at any speed',
      'A two- to three-second gap (more in poor conditions)',
      'Half a second if your brakes are new',
      'No gap is needed below 40 km/h',
    ],
    correctIndex: 1,
    explanation: 'The two- or three-second rule appears in most Canadian handbooks: pick a landmark, and at least two to three seconds should pass after the vehicle ahead before you reach it. Increase the gap in rain, snow, at night, or when someone is tailgating you.',
    topic: 'Rules',
  ),
  PracticeQuestion(
    id: 'rules-crosswalk',
    prompt: 'At a marked crosswalk without signals, you should:',
    choices: [
      'Slow only if a pedestrian has already started crossing in your half of the road',
      'Yield to pedestrians who are in the crosswalk or about to enter it, as your local law requires',
      'Wave pedestrians across while you keep rolling',
      'Never stop, because you might cause a rear-end collision',
    ],
    correctIndex: 1,
    explanation: 'Drivers must yield to pedestrians at marked crosswalks (and often at unmarked intersections). Stop well back so other lanes can see the pedestrian. Do not pass a vehicle that is stopped at a crosswalk.',
    topic: 'Rules',
  ),
  PracticeQuestion(
    id: 'rules-blind-spot',
    prompt: 'Before you change lanes you should:',
    choices: [
      'Mirror check, signal, and shoulder check the blind spot, then move if clear',
      'Signal after you have entered the new lane',
      'Rely on a backup camera only',
      'Honk and move immediately',
    ],
    correctIndex: 0,
    explanation: 'Mirrors do not show the blind spot beside the vehicle. Handbooks teach: mirrors, signal, shoulder check, then move when the gap is safe. Cancel the signal after the lane change.',
    topic: 'Rules',
  ),
  PracticeQuestion(
    id: 'rules-red-right',
    prompt: 'Turning right on a red light is:',
    choices: [
      'Always legal in Canada after a stop',
      'Never legal in Canada',
      'Allowed in many places after a full stop unless a sign prohibits it — but some cities and intersections ban it',
      'Allowed only for buses',
    ],
    correctIndex: 2,
    explanation: 'Right-on-red is not universal. Many jurisdictions allow it after a complete stop unless a sign says no. Some municipalities restrict it. Always stop first, yield to pedestrians and traffic, and obey posted bans. This app will not tell you it is legal at a specific corner.',
    topic: 'Rules',
  ),
  PracticeQuestion(
    id: 'rules-space',
    prompt: 'If you are being tailgated, a safer response is to:',
    choices: [
      'Brake-check the other driver',
      'Increase your own following distance and, when safe, change lanes or pull over to let them pass',
      'Speed up well above the limit',
      'Block both lanes so they cannot pass',
    ],
    correctIndex: 1,
    explanation: 'Give yourself more room in front so you can slow gradually. Let the tailgater pass when it is safe. Do not escalate. Sudden braking can cause a crash you will still be in.',
    topic: 'Rules',
  ),
  PracticeQuestion(
    id: 'rules-roundabout',
    prompt: 'When you enter a roundabout you should:',
    choices: [
      'Stop in the circulating lane to force a gap',
      'Yield to traffic already in the roundabout, then enter when there is a safe gap',
      'Always come to a complete stop even if the roundabout is empty',
      'Enter beside another vehicle and match their speed',
    ],
    correctIndex: 1,
    explanation: 'Yield to vehicles already circulating (usually on your left in Canada). Use your signal when exiting. Do not stop in the circle except to avoid a collision.',
    topic: 'Rules',
  ),
  PracticeQuestion(
    id: 'alc-criminal',
    prompt: 'Under the Criminal Code of Canada, the blood-alcohol offence threshold for a fully licensed adult driver is:',
    choices: [
      '0.02% (20 mg/100 ml)',
      '0.08% (80 mg/100 ml)',
      '0.15% (150 mg/100 ml)',
      'There is no federal alcohol offence — only provincial fines',
    ],
    correctIndex: 1,
    explanation: 'Driving at 80 mg of alcohol per 100 ml of blood (0.08) or more is a criminal offence. Provinces and territories also impose administrative penalties at lower levels (often 0.05). Graduated-licence drivers are typically held to zero.',
    topic: 'Impairment',
  ),
  PracticeQuestion(
    id: 'alc-gdl-zero',
    prompt: 'For most graduated / novice / learner licences in Canada, the alcohol rule while driving is:',
    choices: [
      'The same 0.08 criminal limit as fully licensed adults',
      'Zero — any detectable alcohol can lead to a roadside suspension or worse',
      'One standard drink per hour is allowed',
      'Beer is allowed; spirits are not',
    ],
    correctIndex: 1,
    explanation: 'GDL programs almost universally require zero blood alcohol (and often zero drugs). That is stricter than the Criminal Code 0.08 offence. Check your own stage card — “zero” means none, not “under 0.05”.',
    topic: 'Impairment',
  ),
  PracticeQuestion(
    id: 'alc-drugs',
    prompt: 'Impairment law covers:',
    choices: [
      'Alcohol only',
      'Alcohol, drugs (including cannabis and some medications), and combinations of them',
      'Illegal drugs only, not cannabis or prescriptions',
      'Only if you feel drunk',
    ],
    correctIndex: 1,
    explanation: 'You must not drive while impaired by alcohol, cannabis, other drugs, or a mix. Some prescription and over-the-counter medicines also impair. If the label or your doctor warns against driving, do not drive.',
    topic: 'Impairment',
  ),
  PracticeQuestion(
    id: 'alc-fatigue',
    prompt: 'Driving while extremely tired is dangerous because:',
    choices: [
      'Fatigue is uncomfortable but does not affect reaction time',
      'Fatigue can slow reactions and cause microsleeps similar in risk to impairment',
      'It is only a problem on highways at night',
      'Coffee always removes the risk',
    ],
    correctIndex: 1,
    explanation: 'Handbooks treat fatigue as a serious impairment. The safe response is to stop and rest, not to “push through.” Caffeine is not a substitute for sleep.',
    topic: 'Impairment',
  ),
  PracticeQuestion(
    id: 'alc-plan',
    prompt: 'A responsible plan if you will drink alcohol is:',
    choices: [
      'Drive slowly on back roads',
      'Use a non-drinking driver, taxi, transit, or stay overnight — do not drive',
      'Eat a large meal so you can drive after two drinks',
      'Wait 15 minutes after your last drink',
    ],
    correctIndex: 1,
    explanation: 'There is no reliable home method to calculate your BAC. If you will drink, you are not the driver. GDL drivers must not have any alcohol in their system at all.',
    topic: 'Impairment',
  ),
  PracticeQuestion(
    id: 'alc-refuse',
    prompt: 'Refusing a lawful breath or drug-screening demand from police:',
    choices: [
      'Has no consequence if you were not actually impaired',
      'Can bring serious charges and licence consequences of its own',
      'Is your right without any penalty',
      'Is allowed if you were only on a bicycle',
    ],
    correctIndex: 1,
    explanation: 'Canadian law treats a failure or refusal to comply with a lawful testing demand as a serious offence, separate from the BAC result. Do not take legal advice from a practice app — this is only a study reminder to understand that refusal is not a free pass.',
    topic: 'Impairment',
  ),
  PracticeQuestion(
    id: 'alc-open',
    prompt: 'Open liquor in the passenger compartment while you drive is:',
    choices: [
      'Fine if only passengers are drinking',
      'Generally prohibited; alcohol should be unopened and often stored out of reach, per local liquor and highway laws',
      'Allowed after 9 p.m.',
      'Allowed on rural roads only',
    ],
    correctIndex: 1,
    explanation: 'Provinces and territories restrict open alcohol in motor vehicles. Do not drive with an open drink, and do not let passengers drink in the car. Check the exact storage rules where you live.',
    topic: 'Impairment',
  ),
  PracticeQuestion(
    id: 'alc-morning',
    prompt: 'Alcohol from the night before:',
    choices: [
      'Is always gone after eight hours of sleep',
      'Can still be in your blood in the morning — you may still be over a legal or GDL limit',
      'Only affects you if you have a headache',
      'Does not count if you drink water',
    ],
    correctIndex: 1,
    explanation: 'The body needs time to metabolize alcohol. Morning driving after a heavy night can still be illegal, especially on a zero-tolerance GDL licence.',
    topic: 'Impairment',
  ),
  PracticeQuestion(
    id: 'win-black-ice',
    prompt: 'Black ice is dangerous because:',
    choices: [
      'It is easy to see as a white sheet',
      'It is a thin, often nearly invisible glaze, especially on bridges and overpasses',
      'It only forms below −20 °C',
      'Winter tires make it irrelevant',
    ],
    correctIndex: 1,
    explanation: 'Bridges and overpasses freeze first. If the steering feels light or the road looks glossy, ease off the accelerator and avoid sudden inputs. Winter tires help but do not make ice safe.',
    topic: 'Winter',
  ),
  PracticeQuestion(
    id: 'win-distance',
    prompt: 'In snow or ice you should:',
    choices: [
      'Follow closer so you can use the lead car as a windbreak',
      'Increase following distance substantially and slow down',
      'Use cruise control to hold a steady speed',
      'Keep the same summer following distance',
    ],
    correctIndex: 1,
    explanation: 'Stopping distances grow quickly on snow and ice. Leave a much larger gap. Cruise control is a poor idea on slippery roads because the vehicle may accelerate unexpectedly.',
    topic: 'Winter',
  ),
  PracticeQuestion(
    id: 'win-clear',
    prompt: 'Before you drive in winter you should:',
    choices: [
      'Clear a small peephole in the frost',
      'Clear all windows, mirrors, lights, and the roof of snow and ice',
      'Warm the cabin only; the snow will blow off',
      'Leave snow on the roof so it insulates the car',
    ],
    correctIndex: 1,
    explanation: 'Snow sheets sliding off a roof can blind you or the driver behind. Iced lights hide your brake lamps. Take the time to clear the whole vehicle. Many places can ticket you for this.',
    topic: 'Winter',
  ),
  PracticeQuestion(
    id: 'win-skid',
    prompt:
        'If the rear of the vehicle starts to skid, a common recovery is to:',
    choices: [
      'Slam the brakes and steer the opposite way hard',
      'Ease off the accelerator and steer in the direction you want the front to go (into the skid)',
      'Turn the wheel fully left and hold it',
      'Put the vehicle in reverse',
    ],
    correctIndex: 1,
    explanation: 'Look and steer where you want to go, ease off the gas, and avoid panic braking. ABS (if fitted) lets you brake while steering — apply firm, steady pressure. Practise only in a safe, legal place, not on a public road.',
    topic: 'Winter',
  ),
  PracticeQuestion(
    id: 'win-headlights',
    prompt: 'In heavy snow, rain, or fog you should:',
    choices: [
      'Use high-beam headlights to punch through',
      'Use low-beam headlights so you can see and be seen without glare',
      'Drive with parking lights only',
      'Turn all lights off to reduce reflection',
    ],
    correctIndex: 1,
    explanation: 'Low beams are the usual choice in snow and fog. High beams reflect back into your eyes. Make sure your tail lights are on so others see you.',
    topic: 'Winter',
  ),
  PracticeQuestion(
    id: 'win-tires-qc',
    prompt: 'In Quebec, passenger vehicles generally must use winter tires:',
    choices: [
      'From 1 December to 15 March, unless an exception applies',
      'Only in rural regions',
      'Never — all-season tires are always enough',
      'Only if you are a GDL driver',
    ],
    correctIndex: 0,
    explanation: 'SAAQ requires winter tires on passenger vehicles and taxis from 1 December to 15 March (unless an exception in the regulation applies). Other provinces recommend them; some have different mountain or highway rules. Check the official page for the year you drive.',
    topic: 'Winter',
    appliesTo: ['QC'],
    sourceNote: 'Unofficial study item pointing at SAAQ winter-tire dates.',
  ),
  PracticeQuestion(
    id: 'win-kit',
    prompt: 'A winter emergency kit is most useful if it includes:',
    choices: [
      'Only a phone charger',
      'Items such as a blanket, shovel, scraper, flashlight, booster cables, and extra warm clothing',
      'A second set of summer tires',
      'Flares only',
    ],
    correctIndex: 1,
    explanation: 'Handbooks recommend a kit for breakdowns and storms. Stay with the vehicle if you are stranded in a blizzard unless help is clearly within safe walking distance.',
    topic: 'Winter',
  ),
  PracticeQuestion(
    id: 'win-hills',
    prompt: 'On an icy hill you should:',
    choices: [
      'Get a run-up and hope momentum carries you',
      'Use a low gear, go slowly, and avoid stopping part-way if you can',
      'Ride the brakes all the way down in neutral',
      'Pass slower vehicles on the shoulder',
    ],
    correctIndex: 1,
    explanation: 'Smooth, low-speed inputs beat momentum tricks. Neutral on a descent reduces control. Leave extra space so you are not forced to stop on the slope.',
    topic: 'Winter',
  ),
  PracticeQuestion(
    id: 'on-400',
    prompt: 'In Ontario, a G1 driver generally may not drive on:',
    choices: [
      'Any road with a speed limit over 50 km/h',
      '400-series highways and named high-speed expressways, unless a certified instructor is the accompanying driver',
      'Residential streets after 3 p.m.',
      'Roads outside their home municipality',
    ],
    correctIndex: 1,
    explanation: 'Ontario’s G1 rules ban 400-series highways and listed expressways (QEW, Gardiner, Don Valley Parkway, and others) unless the accompanying driver is a certified instructor. Confirm the current list on ontario.ca.',
    topic: 'Rules',
    appliesTo: ['ON'],
    sourceNote: 'Unofficial study item based on Ontario’s G1 restrictions.',
  ),
  PracticeQuestion(
    id: 'bc-l-sign',
    prompt: 'In British Columbia, a Class 7 learner must:',
    choices: [
      'Display an L sign and drive with a qualified supervisor',
      'Drive alone after two weeks',
      'Use high-occupancy lanes only',
      'Carry a paper log instead of a licence card',
    ],
    correctIndex: 0,
    explanation: 'ICBC’s GLP requires an L sign, a qualified supervisor, zero BAC/BDC, and other learner limits. Passing the knowledge test alone does not let you drive until the licence is issued.',
    topic: 'Rules',
    appliesTo: ['BC'],
    sourceNote: 'Unofficial study item based on ICBC graduated licensing.',
  ),
];

const signsQuiz = PracticeQuiz(
  id: 'signs',
  title: 'Signs and signals',
  subtitle: 'Stop, yield, lights, and pavement markings',
  questionIds: [
    'sign-stop',
    'sign-yield',
    'sign-warning',
    'sign-do-not-enter',
    'sign-flashing-red',
    'sign-flashing-yellow',
    'sign-school',
    'sign-rail',
    'sign-solid-yellow',
    'sign-speed-regulatory',
  ],
);

const rulesQuiz = PracticeQuiz(
  id: 'rules',
  title: 'Rules of the road',
  subtitle: 'Right-of-way, sharing the road, and space',
  questionIds: [
    'rules-seatbelt',
    'rules-four-way',
    'rules-school-bus',
    'rules-emergency',
    'rules-following',
    'rules-crosswalk',
    'rules-blind-spot',
    'rules-red-right',
    'rules-space',
    'rules-roundabout',
    'on-400',
    'bc-l-sign',
  ],
);

const impairmentQuiz = PracticeQuiz(
  id: 'impairment',
  title: 'Alcohol, drugs, and fatigue',
  subtitle: 'Criminal limits, GDL zero, and planning ahead',
  questionIds: [
    'alc-criminal',
    'alc-gdl-zero',
    'alc-drugs',
    'alc-fatigue',
    'alc-plan',
    'alc-refuse',
    'alc-open',
    'alc-morning',
  ],
);

const winterQuiz = PracticeQuiz(
  id: 'winter',
  title: 'Winter driving',
  subtitle: 'Ice, snow, tires, and seeing the road',
  questionIds: [
    'win-black-ice',
    'win-distance',
    'win-clear',
    'win-skid',
    'win-headlights',
    'win-tires-qc',
    'win-kit',
    'win-hills',
  ],
);

const mixedQuiz = PracticeQuiz(
  id: 'mixed',
  title: 'Mixed practice (20)',
  subtitle: 'A 20-question sitting drawn from every topic',
  questionIds: [],
  sampleSize: 20,
);

const List<PracticeQuiz> allQuizzes = [
  signsQuiz,
  rulesQuiz,
  impairmentQuiz,
  winterQuiz,
  mixedQuiz,
];

PracticeQuestion? questionById(String id) {
  for (final q in allQuestions) {
    if (q.id == id) return q;
  }
  return null;
}

List<PracticeQuestion> questionsForQuiz(
  PracticeQuiz quiz, {
  String? jurisdictionCode,
  int? seed,
}) {
  final pool = <PracticeQuestion>[];
  if (quiz.id == mixedQuiz.id) {
    pool.addAll(allQuestions);
  } else {
    for (final id in quiz.questionIds) {
      final q = questionById(id);
      if (q != null) pool.add(q);
    }
  }

  final filtered = pool.where((q) {
    if (q.appliesTo.isEmpty) return true;
    if (jurisdictionCode == null) return true;
    return q.appliesTo.contains(jurisdictionCode);
  }).toList();

  if (quiz.sampleSize == null || filtered.length <= quiz.sampleSize!) {
    return filtered;
  }

  final copy = List<PracticeQuestion>.from(filtered);
  copy.shuffle(seed == null ? null : Random(seed));
  return copy.take(quiz.sampleSize!).toList();
}

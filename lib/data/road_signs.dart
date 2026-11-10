import '../l10n/app_locale.dart';

/// Original in-repo study-aid drawings of common Canadian-style signs.
/// These are not TAC plates or official MOT artwork.
class RoadSign {
  const RoadSign({
    required this.id,
    required this.asset,
    required this.nameEn,
    required this.nameFr,
  });

  final String id;
  final String asset;
  final String nameEn;
  final String nameFr;

  String nameOf(AppLocale locale) => locale.isFr ? nameFr : nameEn;
}

const signStop = RoadSign(
  id: 'stop',
  asset: 'assets/signs/stop.svg',
  nameEn: 'Stop',
  nameFr: 'Arrêt',
);
const signArret = RoadSign(
  id: 'arret',
  asset: 'assets/signs/arret.svg',
  nameEn: 'Stop (ARRÊT)',
  nameFr: 'Arrêt (ARRÊT)',
);
const signYield = RoadSign(
  id: 'yield',
  asset: 'assets/signs/yield.svg',
  nameEn: 'Yield',
  nameFr: 'Cédez',
);
const signCedez = RoadSign(
  id: 'cedez',
  asset: 'assets/signs/cedez.svg',
  nameEn: 'Yield (CÉDEZ)',
  nameFr: 'Cédez (CÉDEZ)',
);
const signDoNotEnter = RoadSign(
  id: 'do_not_enter',
  asset: 'assets/signs/do_not_enter.svg',
  nameEn: 'Do not enter',
  nameFr: 'Entrée interdite',
);
const signMaximum50 = RoadSign(
  id: 'maximum_50',
  asset: 'assets/signs/maximum_50.svg',
  nameEn: 'Maximum 50',
  nameFr: 'Maximum 50',
);
const signSchool = RoadSign(
  id: 'school',
  asset: 'assets/signs/school.svg',
  nameEn: 'School / school crossing',
  nameFr: 'Zone scolaire / traverse',
);
const signRailway = RoadSign(
  id: 'railway',
  asset: 'assets/signs/railway.svg',
  nameEn: 'Railway crossing',
  nameFr: 'Passage à niveau',
);
const signWarningCurve = RoadSign(
  id: 'warning_curve',
  asset: 'assets/signs/warning_curve.svg',
  nameEn: 'Warning (curve)',
  nameFr: 'Danger (courbe)',
);
const signSlippery = RoadSign(
  id: 'slippery',
  asset: 'assets/signs/slippery.svg',
  nameEn: 'Slippery when wet',
  nameFr: 'Chaussée glissante',
);
const signPedestrian = RoadSign(
  id: 'pedestrian',
  asset: 'assets/signs/pedestrian.svg',
  nameEn: 'Pedestrian crossing',
  nameFr: 'Passage pour piétons',
);
const signNoLeft = RoadSign(
  id: 'no_left_turn',
  asset: 'assets/signs/no_left_turn.svg',
  nameEn: 'No left turn',
  nameFr: 'Interdiction de tourner à gauche',
);
const signNoUTurn = RoadSign(
  id: 'no_u_turn',
  asset: 'assets/signs/no_u_turn.svg',
  nameEn: 'No U-turn',
  nameFr: 'Demi-tour interdit',
);
const signRoundabout = RoadSign(
  id: 'roundabout',
  asset: 'assets/signs/roundabout.svg',
  nameEn: 'Roundabout ahead',
  nameFr: 'Carrefour giratoire',
);
const signFlashRed = RoadSign(
  id: 'signal_flash_red',
  asset: 'assets/signs/signal_flash_red.svg',
  nameEn: 'Flashing red signal',
  nameFr: 'Feu rouge clignotant',
);
const signFlashYellow = RoadSign(
  id: 'signal_flash_yellow',
  asset: 'assets/signs/signal_flash_yellow.svg',
  nameEn: 'Flashing yellow signal',
  nameFr: 'Feu jaune clignotant',
);
const signPavementYellow = RoadSign(
  id: 'pavement_yellow',
  asset: 'assets/signs/pavement_yellow.svg',
  nameEn: 'Solid yellow centre line',
  nameFr: 'Ligne centrale jaune continue',
);
const signOneWay = RoadSign(
  id: 'one_way',
  asset: 'assets/signs/one_way.svg',
  nameEn: 'One way',
  nameFr: 'Sens unique',
);

const List<RoadSign> allRoadSigns = [
  signStop,
  signArret,
  signYield,
  signCedez,
  signDoNotEnter,
  signMaximum50,
  signSchool,
  signRailway,
  signWarningCurve,
  signSlippery,
  signPedestrian,
  signNoLeft,
  signNoUTurn,
  signRoundabout,
  signFlashRed,
  signFlashYellow,
  signPavementYellow,
  signOneWay,
];

RoadSign? roadSignById(String? id) {
  if (id == null) return null;
  for (final sign in allRoadSigns) {
    if (sign.id == id) return sign;
  }
  return null;
}

import '../../models/jurisdiction.dart';
import 'central_fr.dart';
import 'east_fr.dart';
import 'models.dart';
import 'north_fr.dart';
import 'west_fr.dart';

const Map<String, FrJurisdiction> frenchJurisdictions = {
  'BC': bcFr,
  'AB': abFr,
  'SK': skFr,
  'MB': mbFr,
  'ON': onFr,
  'QC': qcFr,
  'NS': nsFr,
  'NB': nbFr,
  'PE': peFr,
  'NL': nlFr,
  'YT': ytFr,
  'NT': ntFr,
  'NU': nuFr,
};

FrJurisdiction? frenchFor(String code) => frenchJurisdictions[code];

String jurisdictionName(Jurisdiction j, {required bool french}) =>
    french ? (frenchFor(j.code)?.name ?? j.name) : j.name;

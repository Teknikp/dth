import '../models/jurisdiction.dart';
import 'central.dart';
import 'east.dart';
import 'north.dart';
import 'west.dart';

const List<Jurisdiction> allJurisdictions = [
  alberta,
  britishColumbia,
  manitoba,
  newBrunswick,
  newfoundland,
  novaScotia,
  ontario,
  pei,
  quebec,
  saskatchewan,
  northwestTerritories,
  nunavut,
  yukon,
];

Jurisdiction? jurisdictionByCode(String code) {
  final needle = code.toUpperCase();
  for (final item in allJurisdictions) {
    if (item.code == needle) return item;
  }
  return null;
}

List<Jurisdiction> searchJurisdictions(String query) {
  final q = query.trim().toLowerCase();
  if (q.isEmpty) return List<Jurisdiction>.from(allJurisdictions);
  return allJurisdictions.where((j) {
    if (j.code.toLowerCase() == q) return true;
    if (q.length <= 2) return false;
    if (j.name.toLowerCase().contains(q)) return true;
    if (q.length >= 4 && j.authority.toLowerCase().contains(q)) return true;
    return false;
  }).toList();
}

const expectedJurisdictionCodes = {
  'AB',
  'BC',
  'MB',
  'NB',
  'NL',
  'NS',
  'NT',
  'NU',
  'ON',
  'PE',
  'QC',
  'SK',
  'YT',
};

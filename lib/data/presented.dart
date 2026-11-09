import '../l10n/app_locale.dart';
import '../models/jurisdiction.dart';
import 'french/catalog_fr.dart';
import 'french/models.dart';

class PresentedStage {
  const PresentedStage({
    required this.name,
    required this.classCode,
    required this.duration,
    required this.howToEnter,
    required this.restrictions,
    required this.howToAdvance,
  });

  final String name;
  final String classCode;
  final String duration;
  final String howToEnter;
  final List<String> restrictions;
  final String howToAdvance;
}

class PresentedFee {
  const PresentedFee({
    required this.label,
    required this.amount,
    required this.note,
    required this.isPublished,
  });

  final String label;
  final String? amount;
  final String note;
  final bool isPublished;
}

class PresentedLink {
  const PresentedLink({
    required this.label,
    required this.url,
    required this.englishOnly,
  });

  final String label;
  final String url;
  final bool englishOnly;
}

class PresentedJurisdiction {
  const PresentedJurisdiction({
    required this.raw,
    required this.name,
    required this.authority,
    required this.passengerLicence,
    required this.minLearnerAgeNote,
    required this.parentalConsent,
    required this.stages,
    required this.knowledgeSummary,
    required this.passRule,
    required this.format,
    required this.roadTest,
    required this.medical,
    required this.identityDocuments,
    required this.fees,
    required this.otherClasses,
    required this.sources,
    required this.dataNotes,
    required this.lastReviewed,
  });

  final Jurisdiction raw;
  final String name;
  final String authority;
  final String passengerLicence;
  final String? minLearnerAgeNote;
  final String parentalConsent;
  final List<PresentedStage> stages;
  final String knowledgeSummary;
  final String? passRule;
  final String? format;
  final String roadTest;
  final String medical;
  final List<String> identityDocuments;
  final List<PresentedFee> fees;
  final List<String> otherClasses;
  final List<PresentedLink> sources;
  final String dataNotes;
  final String lastReviewed;

  String get code => raw.code;
  bool get isTerritory => raw.isTerritory;
  String get minLearnerAge => raw.minLearnerAge;
  DataDepth get dataDepth => raw.dataDepth;
  String get handbookUrl => raw.handbookUrl;

  factory PresentedJurisdiction.from(Jurisdiction j, AppLocale locale) {
    final fr = locale.isFr ? frenchFor(j.code) : null;
    if (fr == null) {
      return PresentedJurisdiction(
        raw: j,
        name: j.name,
        authority: j.authority,
        passengerLicence: j.passengerLicence,
        minLearnerAgeNote: j.minLearnerAgeNote,
        parentalConsent: j.parentalConsent,
        stages: [
          for (final s in j.stages)
            PresentedStage(
              name: s.name,
              classCode: s.classCode,
              duration: s.duration,
              howToEnter: s.howToEnter,
              restrictions: s.restrictions,
              howToAdvance: s.howToAdvance,
            ),
        ],
        knowledgeSummary: j.knowledgeTest.summary,
        passRule: j.knowledgeTest.passRule,
        format: j.knowledgeTest.format,
        roadTest: j.roadTest,
        medical: j.medical,
        identityDocuments: j.identityDocuments,
        fees: [
          for (final f in j.fees)
            PresentedFee(
              label: f.label,
              amount: f.amount,
              note: f.note,
              isPublished: f.isPublished,
            ),
        ],
        otherClasses: j.otherClasses,
        sources: [
          for (final l in j.sources)
            PresentedLink(label: l.label, url: l.url, englishOnly: false),
        ],
        dataNotes: j.dataNotes,
        lastReviewed: j.lastReviewed,
      );
    }
    return PresentedJurisdiction(
      raw: j,
      name: fr.name,
      authority: fr.authority,
      passengerLicence: fr.passengerLicence,
      minLearnerAgeNote: fr.minLearnerAgeNote,
      parentalConsent: fr.parentalConsent,
      stages: [
        for (var i = 0; i < j.stages.length; i++)
          _stage(j.stages[i], i < fr.stages.length ? fr.stages[i] : null),
      ],
      knowledgeSummary: fr.knowledgeTest.summary,
      passRule: fr.knowledgeTest.passRule ?? j.knowledgeTest.passRule,
      format: fr.knowledgeTest.format ?? j.knowledgeTest.format,
      roadTest: fr.roadTest,
      medical: fr.medical,
      identityDocuments: fr.identityDocuments,
      fees: [
        for (var i = 0; i < j.fees.length; i++)
          PresentedFee(
            label: i < fr.fees.length ? fr.fees[i].label : j.fees[i].label,
            amount: j.fees[i].amount,
            note: i < fr.fees.length ? fr.fees[i].note : j.fees[i].note,
            isPublished: j.fees[i].isPublished,
          ),
      ],
      otherClasses: fr.otherClasses,
      sources: [
        for (var i = 0; i < j.sources.length; i++)
          PresentedLink(
            label: i < fr.sources.length
                ? fr.sources[i].label
                : j.sources[i].label,
            url: j.sources[i].url,
            englishOnly: i < fr.sources.length && fr.sources[i].englishOnly,
          ),
      ],
      dataNotes: fr.dataNotes,
      lastReviewed: _reviewed(j.lastReviewed, locale),
    );
  }
}

PresentedStage _stage(GdlStage en, FrStage? fr) {
  if (fr == null) {
    return PresentedStage(
      name: en.name,
      classCode: en.classCode,
      duration: en.duration,
      howToEnter: en.howToEnter,
      restrictions: en.restrictions,
      howToAdvance: en.howToAdvance,
    );
  }
  return PresentedStage(
    name: fr.name,
    classCode: en.classCode,
    duration: fr.duration,
    howToEnter: fr.howToEnter,
    restrictions: fr.restrictions,
    howToAdvance: fr.howToAdvance,
  );
}

String _reviewed(String raw, AppLocale locale) {
  if (!locale.isFr) return raw;
  return raw.replaceFirst('November', 'novembre');
}

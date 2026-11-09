class OfficialLink {
  const OfficialLink({required this.label, required this.url});

  final String label;
  final String url;
}

class FeeItem {
  const FeeItem({required this.label, this.amount, required this.note});

  /// Published amount, or null when the official page did not state one.
  final String? amount;
  final String label;
  final String note;

  bool get isPublished => amount != null && amount!.isNotEmpty;
}

class GdlStage {
  const GdlStage({
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

class KnowledgeTestInfo {
  const KnowledgeTestInfo({required this.summary, this.passRule, this.format});

  final String summary;
  final String? passRule;
  final String? format;
}

enum DataDepth {
  /// Core GDL rules taken from a current government or insurer page.
  solid,

  /// Useful official coverage, with some fees or side rules unpublished.
  useful,

  /// Official pages exist but GDL, fees, or tests are thinly documented.
  thin,
}

class Jurisdiction {
  const Jurisdiction({
    required this.code,
    required this.name,
    required this.isTerritory,
    required this.authority,
    required this.passengerLicence,
    required this.minLearnerAge,
    this.minLearnerAgeNote,
    required this.parentalConsent,
    required this.stages,
    required this.knowledgeTest,
    required this.roadTest,
    required this.medical,
    required this.identityDocuments,
    required this.fees,
    required this.otherClasses,
    required this.sources,
    required this.handbookUrl,
    required this.dataDepth,
    required this.dataNotes,
    required this.lastReviewed,
  });

  final String code;
  final String name;
  final bool isTerritory;
  final String authority;
  final String passengerLicence;
  final String minLearnerAge;
  final String? minLearnerAgeNote;
  final String parentalConsent;
  final List<GdlStage> stages;
  final KnowledgeTestInfo knowledgeTest;
  final String roadTest;
  final String medical;
  final List<String> identityDocuments;
  final List<FeeItem> fees;
  final List<String> otherClasses;
  final List<OfficialLink> sources;
  final String handbookUrl;
  final DataDepth dataDepth;
  final String dataNotes;
  final String lastReviewed;

  String get regionLabel => isTerritory ? 'Territory' : 'Province';

  String get searchText =>
      '$code $name $authority $passengerLicence'.toLowerCase();
}

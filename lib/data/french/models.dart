class FrStage {
  const FrStage({
    required this.name,
    required this.duration,
    required this.howToEnter,
    required this.restrictions,
    required this.howToAdvance,
  });

  final String name;
  final String duration;
  final String howToEnter;
  final List<String> restrictions;
  final String howToAdvance;
}

class FrFee {
  const FrFee({required this.label, required this.note});

  final String label;
  final String note;
}

class FrKnowledge {
  const FrKnowledge({required this.summary, this.passRule, this.format});

  final String summary;
  final String? passRule;
  final String? format;
}

class FrLink {
  const FrLink({required this.label, this.englishOnly = false});

  final String label;
  final bool englishOnly;
}

class FrJurisdiction {
  const FrJurisdiction({
    required this.name,
    required this.authority,
    required this.passengerLicence,
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
    required this.dataNotes,
  });

  final String name;
  final String authority;
  final String passengerLicence;
  final String? minLearnerAgeNote;
  final String parentalConsent;
  final List<FrStage> stages;
  final FrKnowledge knowledgeTest;
  final String roadTest;
  final String medical;
  final List<String> identityDocuments;
  final List<FrFee> fees;
  final List<String> otherClasses;
  final List<FrLink> sources;
  final String dataNotes;
}

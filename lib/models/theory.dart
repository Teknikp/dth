import '../l10n/app_locale.dart';

class Copy {
  const Copy(this.en, this.fr);

  final String en;
  final String fr;

  String of(AppLocale locale) => locale.isFr ? fr : en;
}

class TheorySection {
  const TheorySection({
    required this.heading,
    required this.body,
    this.signIds = const [],
  });

  final Copy heading;
  final Copy body;
  final List<String> signIds;
}

class ProvincialNote {
  const ProvincialNote({
    required this.appliesTo,
    required this.heading,
    required this.body,
    this.signIds = const [],
  });

  final List<String> appliesTo;
  final Copy heading;
  final Copy body;
  final List<String> signIds;

  bool matches(String? code) => code != null && appliesTo.contains(code);
}

class TheoryTopic {
  const TheoryTopic({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.lead,
    required this.sections,
    required this.quizIds,
    this.provincialNotes = const [],
    this.usesJurisdictionGdl = false,
  });

  final String id;
  final Copy title;
  final Copy subtitle;
  final Copy lead;
  final List<TheorySection> sections;
  final List<String> quizIds;
  final List<ProvincialNote> provincialNotes;
  final bool usesJurisdictionGdl;

  List<ProvincialNote> notesFor(String? code) =>
      provincialNotes.where((n) => n.matches(code)).toList();
}

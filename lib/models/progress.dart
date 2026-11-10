import '../l10n/app_locale.dart';

enum ProgressItemKind { knowledge, vision, road, wait, admin }

/// On-device progress snapshot.
///
/// v1 stores this JSON in SharedPreferences. When accounts exist, POST the
/// same document keyed by `accountId`. Merge by `updatedAt` per checkbox
/// (`checks[id].updatedAt`). Do not rename item ids once shipped.
class ProgressDocument {
  static const schemaVersion = 1;
  static const storageKey = 'licence_prep.progress.v1';
  static const localeKey = 'licence_prep.locale';

  ProgressDocument({
    this.accountId,
    required this.updatedAt,
    this.activeGoalId,
    List<LicenceGoal>? goals,
  }) : goals = goals ?? [];

  /// Null in v1. Future auth fills this without changing [goals] shape.
  final String? accountId;
  DateTime updatedAt;
  String? activeGoalId;
  final List<LicenceGoal> goals;

  LicenceGoal? get activeGoal {
    if (activeGoalId == null) return null;
    for (final goal in goals) {
      if (goal.id == activeGoalId) return goal;
    }
    return null;
  }

  Map<String, dynamic> toJson() => {
    'schemaVersion': schemaVersion,
    'accountId': accountId,
    'updatedAt': updatedAt.toIso8601String(),
    'activeGoalId': activeGoalId,
    'goals': goals.map((g) => g.toJson()).toList(),
  };

  factory ProgressDocument.fromJson(Map<String, dynamic> json) {
    final rawGoals = json['goals'] as List<dynamic>? ?? const [];
    return ProgressDocument(
      accountId: json['accountId'] as String?,
      updatedAt:
          DateTime.tryParse(json['updatedAt'] as String? ?? '') ??
          DateTime.now().toUtc(),
      activeGoalId: json['activeGoalId'] as String?,
      goals: [
        for (final item in rawGoals)
          if (item is Map<String, dynamic>) LicenceGoal.fromJson(item),
      ],
    );
  }

  factory ProgressDocument.empty() =>
      ProgressDocument(updatedAt: DateTime.now().toUtc());
}

class LicenceGoal {
  LicenceGoal({
    required this.id,
    required this.jurisdictionCode,
    required this.kind,
    required this.createdAt,
    required this.updatedAt,
    this.targetStageIndex,
    Map<String, ProgressCheck>? checks,
  }) : checks = checks ?? {};

  final String id;
  final String jurisdictionCode;

  /// Stable kind string so later goals (exchange, motorcycle) can coexist.
  final String kind;
  final int? targetStageIndex;
  final DateTime createdAt;
  DateTime updatedAt;
  final Map<String, ProgressCheck> checks;

  static const firstPassengerLicence = 'firstPassengerLicence';

  bool isDone(String itemId) => checks[itemId]?.done ?? false;

  Map<String, dynamic> toJson() => {
    'id': id,
    'jurisdictionCode': jurisdictionCode,
    'kind': kind,
    'targetStageIndex': targetStageIndex,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
    'checks': {for (final e in checks.entries) e.key: e.value.toJson()},
  };

  factory LicenceGoal.fromJson(Map<String, dynamic> json) {
    final raw = json['checks'] as Map<String, dynamic>? ?? const {};
    return LicenceGoal(
      id: json['id'] as String,
      jurisdictionCode: json['jurisdictionCode'] as String,
      kind: json['kind'] as String? ?? firstPassengerLicence,
      targetStageIndex: json['targetStageIndex'] as int?,
      createdAt:
          DateTime.tryParse(json['createdAt'] as String? ?? '') ??
          DateTime.now().toUtc(),
      updatedAt:
          DateTime.tryParse(json['updatedAt'] as String? ?? '') ??
          DateTime.now().toUtc(),
      checks: {
        for (final e in raw.entries)
          if (e.value is Map<String, dynamic>)
            e.key: ProgressCheck.fromJson(e.value as Map<String, dynamic>),
      },
    );
  }
}

class ProgressCheck {
  ProgressCheck({required this.done, this.updatedAt});

  bool done;
  DateTime? updatedAt;

  Map<String, dynamic> toJson() => {
    'done': done,
    'updatedAt': updatedAt?.toIso8601String(),
  };

  factory ProgressCheck.fromJson(Map<String, dynamic> json) {
    return ProgressCheck(
      done: json['done'] as bool? ?? false,
      updatedAt: DateTime.tryParse(json['updatedAt'] as String? ?? ''),
    );
  }
}

class ProgressItemDef {
  const ProgressItemDef({
    required this.id,
    required this.group,
    required this.titleEn,
    required this.titleFr,
    this.shortEn,
    this.shortFr,
    this.detailEn,
    this.detailFr,
  });

  final String id;
  final String group;
  final String titleEn;
  final String titleFr;
  final String? shortEn;
  final String? shortFr;
  final String? detailEn;
  final String? detailFr;

  String title(AppLocale locale) => locale.isFr ? titleFr : titleEn;

  String shortLabel(AppLocale locale) {
    final short = locale.isFr ? shortFr : shortEn;
    if (short != null && short.isNotEmpty) return short;
    return title(locale);
  }

  String detail(AppLocale locale) => (locale.isFr ? detailFr : detailEn) ?? '';

  ProgressItemKind get kind {
    if (id.endsWith('.knowledge')) return ProgressItemKind.knowledge;
    if (id.endsWith('.vision')) return ProgressItemKind.vision;
    if (id.endsWith('.road')) return ProgressItemKind.road;
    if (group == 'gdl') return ProgressItemKind.wait;
    return ProgressItemKind.admin;
  }
}

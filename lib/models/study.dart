/// On-device bookmarks and weak-topic counts.
///
/// Separate from [ProgressDocument] so checklist JSON stays `licence_prep.progress.v1`.
class StudyDocument {
  static const schemaVersion = 1;
  static const storageKey = 'licence_prep.study.v1';

  StudyDocument({
    required this.updatedAt,
    Set<String>? bookmarks,
    Map<String, int>? weakCounts,
  }) : bookmarks = bookmarks ?? <String>{},
       weakCounts = weakCounts ?? <String, int>{};

  DateTime updatedAt;
  final Set<String> bookmarks;
  final Map<String, int> weakCounts;

  factory StudyDocument.empty() =>
      StudyDocument(updatedAt: DateTime.fromMillisecondsSinceEpoch(0, isUtc: true));

  bool isBookmarked(String topicId) => bookmarks.contains(topicId);

  List<String> get savedTopicIds {
    final ids = {...bookmarks, ...weakCounts.keys};
    final ordered = ids.toList()..sort();
    return ordered;
  }

  void toggleBookmark(String topicId) {
    if (!bookmarks.add(topicId)) {
      bookmarks.remove(topicId);
    }
  }

  void recordMisses(Iterable<String> topicIds) {
    for (final id in topicIds) {
      if (id.isEmpty) continue;
      weakCounts[id] = (weakCounts[id] ?? 0) + 1;
    }
  }

  Map<String, dynamic> toJson() => {
    'schemaVersion': schemaVersion,
    'updatedAt': updatedAt.toIso8601String(),
    'bookmarks': bookmarks.toList()..sort(),
    'weakCounts': weakCounts,
  };

  factory StudyDocument.fromJson(Map<String, dynamic> json) {
    final rawMarks = json['bookmarks'];
    final marks = <String>{};
    if (rawMarks is List) {
      for (final item in rawMarks) {
        if (item is String && item.isNotEmpty) marks.add(item);
      }
    }
    final rawWeak = json['weakCounts'];
    final weak = <String, int>{};
    if (rawWeak is Map) {
      rawWeak.forEach((key, value) {
        if (key is String && value is int && value > 0) {
          weak[key] = value;
        } else if (key is String && value is num && value > 0) {
          weak[key] = value.toInt();
        }
      });
    }
    return StudyDocument(
      updatedAt:
          DateTime.tryParse(json['updatedAt'] as String? ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0, isUtc: true),
      bookmarks: marks,
      weakCounts: weak,
    );
  }
}

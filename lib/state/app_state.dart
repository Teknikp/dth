import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../l10n/app_locale.dart';
import '../l10n/strings.dart';
import '../models/progress.dart';
import '../models/study.dart';

class AppState extends ChangeNotifier {
  AppState({
    required SharedPreferences prefs,
    required this.locale,
    required this.progress,
    required this.study,
  }) : _prefs = prefs; // ignore: prefer_initializing_formals

  final SharedPreferences _prefs;
  AppLocale locale;
  ProgressDocument progress;
  StudyDocument study;

  S get s => S(locale);

  static Future<AppState> load({SharedPreferences? prefs}) async {
    final store = prefs ?? await SharedPreferences.getInstance();
    final locale = AppLocale.parse(store.getString(ProgressDocument.localeKey));
    ProgressDocument progress;
    final raw = store.getString(ProgressDocument.storageKey);
    if (raw == null || raw.isEmpty) {
      progress = ProgressDocument.empty();
    } else {
      try {
        progress = ProgressDocument.fromJson(
          jsonDecode(raw) as Map<String, dynamic>,
        );
      } catch (_) {
        progress = ProgressDocument.empty();
      }
    }
    StudyDocument study;
    final studyRaw = store.getString(StudyDocument.storageKey);
    if (studyRaw == null || studyRaw.isEmpty) {
      study = StudyDocument.empty();
    } else {
      try {
        study = StudyDocument.fromJson(
          jsonDecode(studyRaw) as Map<String, dynamic>,
        );
      } catch (_) {
        study = StudyDocument.empty();
      }
    }
    return AppState(
      prefs: store,
      locale: locale,
      progress: progress,
      study: study,
    );
  }

  Future<void> setLocale(AppLocale next) async {
    locale = next;
    await _prefs.setString(ProgressDocument.localeKey, next.languageCode);
    notifyListeners();
  }

  Future<void> _persistProgress() async {
    progress.updatedAt = DateTime.now().toUtc();
    await _prefs.setString(
      ProgressDocument.storageKey,
      jsonEncode(progress.toJson()),
    );
    notifyListeners();
  }

  Future<void> setActiveGoal(LicenceGoal goal) async {
    final existing = progress.goals.indexWhere((g) => g.id == goal.id);
    if (existing >= 0) {
      progress.goals[existing] = goal;
    } else {
      progress.goals.removeWhere(
        (g) =>
            g.jurisdictionCode == goal.jurisdictionCode && g.kind == goal.kind,
      );
      progress.goals.add(goal);
    }
    progress.activeGoalId = goal.id;
    await _persistProgress();
  }

  Future<void> toggleCheck(String itemId, {required bool done}) async {
    final goal = progress.activeGoal;
    if (goal == null) return;
    goal.checks[itemId] = ProgressCheck(
      done: done,
      updatedAt: DateTime.now().toUtc(),
    );
    goal.updatedAt = DateTime.now().toUtc();
    await _persistProgress();
  }

  Future<void> markCompletedUpTo(List<String> itemIds) async {
    final goal = progress.activeGoal;
    if (goal == null) return;
    final now = DateTime.now().toUtc();
    for (final id in itemIds) {
      goal.checks[id] = ProgressCheck(done: true, updatedAt: now);
    }
    goal.updatedAt = now;
    await _persistProgress();
  }

  Future<void> resetChecks() async {
    final goal = progress.activeGoal;
    if (goal == null) return;
    goal.checks.clear();
    goal.updatedAt = DateTime.now().toUtc();
    await _persistProgress();
  }

  Future<void> _persistStudy() async {
    study.updatedAt = DateTime.now().toUtc();
    await _prefs.setString(
      StudyDocument.storageKey,
      jsonEncode(study.toJson()),
    );
    notifyListeners();
  }

  Future<void> toggleBookmark(String topicId) async {
    study.toggleBookmark(topicId);
    await _persistStudy();
  }

  Future<void> recordMisses(Iterable<String> topicIds) async {
    final list = topicIds.where((id) => id.isNotEmpty).toList();
    if (list.isEmpty) return;
    study.recordMisses(list);
    await _persistStudy();
  }

  Future<void> bookmarkTopics(Iterable<String> topicIds) async {
    var changed = false;
    for (final id in topicIds) {
      if (id.isEmpty || study.bookmarks.contains(id)) continue;
      study.bookmarks.add(id);
      changed = true;
    }
    if (!changed) return;
    await _persistStudy();
  }
}

class AppScope extends InheritedNotifier<AppState> {
  const AppScope({super.key, required AppState state, required super.child})
    : super(notifier: state);

  static AppState of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<AppScope>();
    assert(scope != null, 'AppScope missing');
    return scope!.notifier!;
  }

  static S s(BuildContext context) => of(context).s;
}

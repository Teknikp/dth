import '../l10n/app_locale.dart';
import '../models/jurisdiction.dart';
import '../models/progress.dart';
import 'french/catalog_fr.dart';

String _slug(String classCode) {
  return classCode
      .toLowerCase()
      .replaceAll(RegExp(r'[^a-z0-9]+'), '-')
      .replaceAll(RegExp(r'^-+|-+$'), '');
}

List<ProgressItemDef> progressItemsFor(Jurisdiction j) {
  final code = j.code;
  return [
    ProgressItemDef(
      id: '$code.documents',
      group: 'prepare',
      titleEn: 'Gather accepted identity documents',
      titleFr: 'Rassembler les pièces d’identité acceptées',
      detailEn: 'Original, valid ID as listed by ${j.authority}.',
      detailFr:
          'Pièces originales et valides, selon ${frenchFor(code)?.authority ?? j.authority}.',
    ),
    ProgressItemDef(
      id: '$code.consent',
      group: 'prepare',
      titleEn: 'Parental consent if you are under the local age',
      titleFr: 'Consentement parental si vous n’avez pas l’âge requis',
    ),
    ProgressItemDef(
      id: '$code.knowledge',
      group: 'tests',
      titleEn: 'Pass the knowledge test',
      titleFr: 'Réussir l’examen de connaissances',
    ),
    ProgressItemDef(
      id: '$code.vision',
      group: 'tests',
      titleEn: 'Pass the vision screening',
      titleFr: 'Réussir le test de vision',
    ),
    ProgressItemDef(
      id: '$code.road',
      group: 'tests',
      titleEn: 'Pass the first road test (when you are eligible)',
      titleFr:
          'Réussir le premier examen pratique (lorsque vous y êtes admissible)',
    ),
    for (var i = 0; i < j.stages.length; i++)
      ProgressItemDef(
        id: '$code.gdl.${_slug(j.stages[i].classCode)}',
        group: 'gdl',
        titleEn: 'Complete: ${j.stages[i].name}',
        titleFr:
            'Terminer : ${frenchFor(code)?.stages.elementAtOrNull(i)?.name ?? j.stages[i].name}',
        detailEn: j.stages[i].duration,
        detailFr:
            frenchFor(code)?.stages.elementAtOrNull(i)?.duration ??
            j.stages[i].duration,
      ),
  ];
}

String itemTitle(ProgressItemDef item, AppLocale locale) =>
    locale.isFr ? item.titleFr : item.titleEn;

String? itemDetail(ProgressItemDef item, AppLocale locale) =>
    locale.isFr ? item.detailFr : item.detailEn;

String knowledgeItemId(String code) => '$code.knowledge';

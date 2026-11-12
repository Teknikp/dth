import 'app_locale.dart';

class S {
  const S(this.locale);

  final AppLocale locale;

  bool get isFr => locale.isFr;

  String get appName => isFr ? 'Prépa Permis' : 'Licence Prep';
  String get homeTitle => isFr ? 'Permis canadien' : 'Canadian licence prep';
  String get homeSubtitle => isFr
      ? 'Choisissez une province ou un territoire, consultez les exigences, puis pratiquez l’examen de connaissances.'
      : 'Pick a province or territory for official-style requirements, then practise the knowledge test.';
  String get searchHint =>
      isFr ? 'Rechercher par nom ou code' : 'Search by name or code';
  String get navLicences => isFr ? 'Permis' : 'Licences';
  String get navProgress => isFr ? 'Suivi' : 'Progress';
  String get navPractice => isFr ? 'Pratique' : 'Practice';
  String get navTheory => isFr ? 'Théorie' : 'Theory';
  String get navAbout => isFr ? 'À propos' : 'About';
  String get disclaimer => isFr
      ? 'Ceci n’est pas un avis juridique. Les règles et les tarifs changent. Confirmez tout sur les pages officielles avant de présenter une demande ou de conduire.'
      : 'Not legal advice. Rules and fees change. Confirm everything on the official pages before you apply or drive.';
  String get disclaimerPractice => isFr
      ? 'Matériel d’étude non officiel, pas un avis juridique. Les examens et guides officiels ont toujours préséance.'
      : 'Unofficial study material, not legal advice. Official tests and handbooks always win.';
  String get unofficialStudy =>
      isFr ? 'étude non officielle' : 'unofficial study';
  String get limitedDetail =>
      isFr ? 'Peu de détail officiel' : 'Limited official detail';
  String get thinData =>
      isFr ? 'Données officielles limitées' : 'Thin official data';
  String get province => isFr ? 'Province' : 'Province';
  String get territory => isFr ? 'Territoire' : 'Territory';
  String learnerFrom(String age) =>
      isFr ? 'Apprenti dès $age ans' : 'Learner from $age';
  String reviewed(String when) => isFr ? 'Vérifié $when' : 'Reviewed $when';
  String get parentalConsent =>
      isFr ? 'Consentement parental' : 'Parental consent';
  String get graduatedLicensing =>
      isFr ? 'Permis progressif' : 'Graduated licensing';
  String get knowledgeTest =>
      isFr ? 'Examen de connaissances' : 'Knowledge test';
  String get passMark => isFr ? 'Note de passage' : 'Pass mark';
  String get format => isFr ? 'Format' : 'Format';
  String get practiseSigns => isFr
      ? 'Pratiquer les panneaux (non officiel)'
      : 'Practise signs (unofficial)';
  String get allQuizzes =>
      isFr ? 'Tous les questionnaires' : 'All practice quizzes';
  String get roadTest => isFr ? 'Examen pratique' : 'Road test';
  String get medicalVision => isFr ? 'Santé et vision' : 'Medical and vision';
  String get documents => isFr ? 'Pièces d’identité' : 'Documents';
  String get fees => isFr
      ? 'Tarifs (seulement s’ils sont publiés)'
      : 'Fees (only if published)';
  String get amountUnpublished =>
      isFr ? 'Montant non publié ici' : 'Amount not published here';
  String get otherClasses => isFr ? 'Autres classes' : 'Other classes';
  String get aboutSummary =>
      isFr ? 'Au sujet de ce résumé' : 'About this summary';
  String get officialSources =>
      isFr ? 'Sources officielles' : 'Official sources';
  String get openHandbook => isFr
      ? 'Ouvrir le guide ou manuel officiel'
      : 'Open the official handbook or guide';
  String get officialPageMayBeEn => isFr
      ? 'La page officielle peut être en anglais seulement. Le résumé ci-dessus est une aide d’étude, pas le texte de loi.'
      : 'Some official pages are English-only. The summary above is a study aid, not the statute.';
  String get timeInStage =>
      isFr ? 'Durée de cette étape' : 'Time in this stage';
  String get howYouEnter => isFr ? 'Comment y entrer' : 'How you enter';
  String get restrictions => isFr ? 'Restrictions' : 'Restrictions';
  String get howYouMoveOn => isFr ? 'Comment avancer' : 'How you move on';
  String get practiceQuizzes =>
      isFr ? 'Questionnaires d’étude' : 'Practice quizzes';
  String get practiceCanada => isFr
      ? 'Questions pancanadiennes, plus quelques exemples provinciaux.'
      : 'Canada-wide study items, plus a few province-specific examples.';
  String questionsFor(String name) => isFr
      ? 'Questions pour $name, plus des items pancanadiens.'
      : 'Questions for $name, plus Canada-wide items.';
  String questionCount(int n) =>
      isFr ? '$n questions · non officiel' : '$n questions · unofficial';
  String get practice => isFr ? 'Pratique' : 'Practice';
  String questionN(int i, int total) =>
      isFr ? 'Question $i sur $total' : 'Question $i of $total';
  String get correct => isFr ? 'Bonne réponse' : 'Correct';
  String get notQuite => isFr ? 'Pas tout à fait' : 'Not quite';
  String get seeResults => isFr ? 'Voir les résultats' : 'See results';
  String get nextQuestion => isFr ? 'Question suivante' : 'Next question';
  String get noQuestions =>
      isFr ? 'Aucune question dans ce jeu.' : 'No questions in this set.';
  String get results => isFr ? 'Résultats' : 'Results';
  String correctOf(int n, int total) =>
      isFr ? '$n sur $total bonnes réponses' : '$n of $total correct';
  String get unofficialScore => isFr
      ? 'Ce score sert seulement à l’étude. Ce n’est pas un résultat d’examen officiel.'
      : 'This score is only for unofficial practice. It is not an official knowledge-test result.';
  String get tryAgain => isFr ? 'Recommencer ce jeu' : 'Try this set again';
  String get review => isFr ? 'Révision' : 'Review';
  String qCorrect(int n) => isFr ? 'Q$n · juste' : 'Q$n · correct';
  String qMissed(int n) => isFr ? 'Q$n · manquée' : 'Q$n · missed';
  String answerLabel(String text) => isFr ? 'Réponse : $text' : 'Answer: $text';
  String get about => isFr ? 'À propos' : 'About';
  String get aboutIntro => isFr
      ? 'Un aide-mémoire pour savoir comment obtenir un permis de véhicule de tourisme dans une province ou un territoire canadien, pour étudier la théorie, et pour pratiquer les sujets d’examen de connaissances.'
      : 'A v1 study aid for people looking up how to get a passenger-vehicle licence in a Canadian province or territory, studying theory, and practising knowledge-test topics.';
  String get whatItIs => isFr ? 'Ce que fait l’appli' : 'What this app is';
  String get whatItIsBody => isFr
      ? 'Résumés du permis progressif, des examens, des pièces, des notes médicales/vision, et des tarifs lorsqu’une page gouvernementale les publie. Leçons de théorie puis questionnaires, avec des dessins originaux de panneaux. Aucun compte n’est requis. Le suivi se garde sur l’appareil.'
      : 'Summaries of graduated licensing, tests, documents, medical/vision notes, and fees when a government or Crown insurer page published a number. Theory lessons then quizzes, with original sign drawings. No account is required. Progress stays on this device.';
  String get whatItIsNot =>
      isFr ? 'Ce que l’appli n’est pas' : 'What this app is not';
  String get whatItIsNotBody => isFr
      ? 'Ce n’est pas l’examen officiel, pas un avis juridique, et pas une copie complète d’un manuel. Si un tarif ou une règle n’était pas sur la page officielle consultée, l’appli le dit et pointe vers cette page au lieu d’inventer un chiffre.'
      : 'It is not the official test, not legal advice, and not a complete copy of any handbook. If a fee or rule was not on the official page we reviewed, the app says so and points you to that page instead of inventing a number.';
  String get language => isFr ? 'Langue' : 'Language';
  String get languageBody => isFr
      ? 'L’appli est offerte en français et en anglais. Le choix est mémorisé sur l’appareil. Les liens officiels restent dans la langue du site gouvernemental; un résumé français est fourni ici.'
      : 'The app is available in English and French. Your choice is saved on this device. Official links stay in the government’s language; a French summary is provided in the app when you switch.';
  String get progressTitle => isFr ? 'Votre parcours' : 'Your progress';
  String get progressEmpty => isFr
      ? 'Choisissez où vous voulez un permis. Cochez les étapes (examens, vision, attentes du permis progressif). Tout reste sur cet appareil, sans compte.'
      : 'Pick where you want a licence. Check off stages (tests, vision, GDL waits). Everything stays on this device — no account.';
  String get setGoal => isFr ? 'Définir un objectif' : 'Set a goal';
  String get changeGoal => isFr ? 'Changer d’objectif' : 'Change goal';
  String get firstLicence => isFr
      ? 'Obtenir un premier permis de tourisme'
      : 'Getting a first passenger licence';
  String get pickPlace =>
      isFr ? 'Province ou territoire' : 'Province or territory';
  String get whereNow => isFr ? 'Où en êtes-vous ?' : 'Where are you now?';
  String get notStarted => isFr ? 'Pas encore commencé' : 'Not started yet';
  String get saveGoal => isFr ? 'Enregistrer l’objectif' : 'Save goal';
  String get cancel => isFr ? 'Annuler' : 'Cancel';
  String get trackHere => isFr ? 'Suivre ce permis' : 'Track this licence';
  String get groupPrepare => isFr ? 'Préparer' : 'Prepare';
  String get groupTests => isFr ? 'Examens' : 'Tests';
  String get groupGdl => isFr ? 'Étapes du permis' : 'Licence stages';
  String doneOf(int n, int total) =>
      isFr ? '$n sur $total terminées' : '$n of $total done';
  String get startHere =>
      isFr ? 'Marquer comme point de départ' : 'Mark as starting point';
  String get progressOnDevice => isFr
      ? 'Sauvegardé seulement sur cet appareil. Un futur compte pourra synchroniser le même document.'
      : 'Saved only on this device. A future signed-in account can sync the same document.';
  String get clearChecks =>
      isFr ? 'Réinitialiser les cases' : 'Reset checkboxes';
  String get english => 'English';
  String get french => 'Français';
  String get transportCanada => isFr
      ? 'Transports Canada — sécurité routière'
      : 'Transport Canada — road safety';
  String get startPractice => isFr ? 'Commencer' : 'Start practice';
  String get checkAnswer => isFr ? 'Vérifier' : 'Check answer';
  String get backToQuizzes =>
      isFr ? 'Retour aux questionnaires' : 'Back to quizzes';
  String get markKnowledgeDone => isFr
      ? 'Marquer l’examen de connaissances comme réussi'
      : 'Mark knowledge test as done';
  String get missed => isFr ? 'Manquée' : 'Missed';
  String checklistFor(String name) =>
      isFr ? 'Liste pour $name' : 'Checklist for $name';
  String get openRequirements =>
      isFr ? 'Voir les exigences' : 'View requirements';
  String get pickGoalHint => progressEmpty;
  String get yourGoal => setGoal;
  String get chooseProvince => pickPlace;
  String get resetChecks => clearChecks;
  String get quizHubLead => practiceCanada;
  String get quizHubBody => practiceCanada;
  String get progressLead => progressMapLead;
  String get progressBody => progressOnDevice;
  String get aboutTitle => about;
  String get aboutLead => aboutIntro;
  String get aboutBody => whatItIsBody;
  String questionOf(int i, int total) => questionN(i, total);
  String get practiceResult => results;
  String youScored(int n, int total) => correctOf(n, total);
  String get resultBody => unofficialScore;
  String get theoryTitle => isFr ? 'Théorie' : 'Theory';
  String get theoryLead => isFr
      ? 'Étudiez un sujet comme dans un guide, puis passez un questionnaire. Contenu pancanadien, plus des notes là où les règles changent.'
      : 'Study a topic the way a handbook is organised, then take a quiz. Canada-wide content, plus notes where the rules change.';
  String get theoryBody => isFr
      ? 'Choisissez un lieu d’étude pour voir les notes provinciales (pneus d’hiver au Québec, autoroutes G1 en Ontario). Les leçons sont des aides d’étude originales, pas le texte d’un manuel.'
      : 'Pick a study place to see provincial notes (Québec winter tires, Ontario G1 freeways). Lessons are original study aids, not handbook text.';
  String get studyPlace => isFr ? 'Étudier pour' : 'Study for';
  String get canadaWide => isFr ? 'Pancanadien' : 'Canada-wide';
  String get startTopicQuiz =>
      isFr ? 'Questionnaire sur ce sujet' : 'Practice this topic';
  String get moreQuizzes => isFr ? 'Autres questionnaires' : 'More quizzes';
  String get openLesson => isFr ? 'Ouvrir la leçon' : 'Open lesson';
  String get gdlStagesHere => isFr
      ? 'Étapes chez vous (résumé non officiel)'
      : 'Stages where you are (unofficial summary)';
  String get pickPlaceForGdl => isFr
      ? 'Choisissez une province ou un territoire plus haut pour voir ses étapes de permis progressif.'
      : 'Pick a province or territory above to see its graduated-licence stages.';
  String get theorySignCaption => isFr
      ? 'Dessin d’étude original, pas une plaque officielle.'
      : 'Original study-aid drawing, not an official plate.';
  String get fromTheory => isFr ? 'Depuis la théorie' : 'From theory';
  String get progressMapLead => isFr
      ? 'Touchez une étape pour la cocher. La voiture avance sur le sentier.'
      : 'Tap a stop to check it off. The car rolls along the path.';
  String get mapStart => isFr ? 'Départ' : 'Start';
  String get mapFinish => isFr ? 'Permis' : 'Licence';
  String get markStopDone => isFr ? 'Marquer comme fait' : 'Mark as done';
  String get clearStop => isFr ? 'Retirer la coche' : 'Clear this stop';
  String get backToMap => isFr ? 'Retour à la carte' : 'Back to the map';
  String get previousStep => isFr ? 'Étape précédente' : 'Previous step';
  String get nextStep => isFr ? 'Étape suivante' : 'Next step';
  String get sourcesByPlace => isFr
      ? 'Groupées par province et territoire. Chaque lien mène à la page officielle de cet endroit.'
      : 'Grouped by province and territory. Each link opens that place’s official page.';
  String get provincesHeading => isFr ? 'Provinces' : 'Provinces';
  String get territoriesHeading => isFr ? 'Territoires' : 'Territories';
  String get unofficialMap => isFr
      ? 'Carte d’étude, pas un avis juridique.'
      : 'Study map, not legal advice.';
  String get yourLicenceMap => isFr ? 'Carte du permis' : 'Licence map';
  String mapFor(String name) => isFr ? 'Sentier — $name' : 'Trail — $name';
  String get gdlWaitTitle => isFr
      ? 'Délais officiels du permis progressif'
      : 'Official GDL stage times';
  String get gdlWaitButton =>
      isFr ? 'Délais GDL officiels' : 'Official GDL times';
  String get gdlWaitLead => isFr
      ? 'Temps minimum publié pour chaque étape, d’après l’autorité de délivrance. Les files d’attente pour réserver un examen ne figurent ici que si la page officielle les publie — sinon nous le disons.'
      : 'Minimum time in each licence stage, as published by the licensing authority. Road-test booking queues appear here only if that official page published them — otherwise we say so.';
  String get gdlWaitNotBooking => isFr
      ? 'Ce n’est pas un délai de rendez-vous. Confirmez sur la page citée; les règles changent.'
      : 'This is not a booking-queue estimate. Confirm on the cited page; rules change.';
  String get gdlWaitOpenSources =>
      isFr ? 'Ouvrir les pages officielles' : 'Open official pages';
  String get gdlWaitUnpublished => isFr
      ? 'Cette administration ne publie pas d’horaire GDL pluriannuel comme la plupart des provinces. Le texte ci-dessous est ce que les pages actuelles disent — rien n’est inventé.'
      : 'This authority does not publish a multi-year GDL timetable like most provinces. The text below is what the current pages say — nothing is invented.';
  String get startMockExam =>
      isFr ? 'Commencer l’examen blanc' : 'Start mock exam';
  String scorePercent(int n) => isFr ? 'Score : $n %' : 'Score: $n%';
  String unofficialPassLabel(int n) => isFr
      ? 'Seuil d’étude non officiel : $n %. Ce n’est pas la note de passage d’un examen officiel — les vrais tests diffèrent selon la province ou le territoire.'
      : 'Unofficial study threshold: $n%. This is not an official pass mark — real tests differ by province or territory.';
  String get unofficialPass => isFr
      ? 'Au-dessus de ce seuil d’étude non officiel.'
      : 'Above this unofficial study threshold.';
  String get unofficialFail => isFr
      ? 'Sous ce seuil d’étude non officiel. Révisez, puis réessayez.'
      : 'Below this unofficial study threshold. Review, then try again.';
  String get bookmarkTopic =>
      isFr ? 'Enregistrer ce sujet' : 'Bookmark this topic';
  String get removeBookmark => isFr ? 'Retirer le signet' : 'Remove bookmark';
  String get savedTopics =>
      isFr ? 'Sujets enregistrés et à revoir' : 'Saved and weak topics';
  String get weakTopicsLead => isFr ? 'Questions manquées' : 'Missed questions';
  String get weakTopicsBody => isFr
      ? 'Les sujets manqués sont enregistrés sur l’appareil. Vous pouvez aussi les marquer pour les revoir.'
      : 'Missed topics are stored on this device. You can also bookmark them to review later.';
  String get saveMissedTopics =>
      isFr ? 'Enregistrer les sujets manqués' : 'Save missed topics';
  String get saveTopic => isFr ? 'Enregistrer' : 'Save topic';
  String get topicsSaved => isFr
      ? 'Sujets enregistrés sur l’appareil.'
      : 'Topics saved on this device.';
  String reviewTopic(String name) => isFr ? 'Revoir : $name' : 'Review: $name';
  String get practiceSavedTopics =>
      isFr ? 'Pratiquer les sujets enregistrés' : 'Practice saved topics';
  String missedCount(int n) => isFr ? '$n manquée(s)' : '$n missed';
}

enum AppLocale {
  en,
  fr;

  bool get isFr => this == AppLocale.fr;

  String get languageCode => name;

  String get shortLabel => this == AppLocale.fr ? 'FR' : 'EN';

  static AppLocale parse(String? raw) {
    if (raw == 'fr') return AppLocale.fr;
    return AppLocale.en;
  }
}

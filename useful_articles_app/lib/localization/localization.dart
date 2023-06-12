import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

class L10n {
  final Locale locale;
  Map<String, String> _sentences = {};

  L10n(this.locale);

  static L10n? of(BuildContext context) =>
      Localizations.of<L10n>(context, L10n);

  Future<bool> load() async {
    final path = 'assets/lang/${locale.languageCode}.json';
    final data = await rootBundle.loadString(path);
    final Map<String, dynamic> _result = json.decode(data);

    _sentences = <String, String>{};
    _result.forEach((String key, dynamic value) {
      _sentences[key] = value.toString();
    });

    return true;
  }

  String translate(String? key) {
    return _sentences[key] ?? '';
  }
}

class L10nDelegate extends LocalizationsDelegate<L10n> {

  final List<String> supportedLocalCodes;

  const L10nDelegate(this.supportedLocalCodes);

  @override
  bool isSupported(Locale locale) {
    return supportedLocalCodes.contains(locale.languageCode);
  }

  @override
  Future<L10n> load(Locale locale) async {
    final localizations = L10n(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(L10nDelegate old) => false;
}

class FallbackCupertinoLocalizationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {

  final List<String> supportedLocalCodes;

  const FallbackCupertinoLocalizationsDelegate(this.supportedLocalCodes);

  @override
  bool isSupported(Locale locale) {
    return supportedLocalCodes.contains(locale.languageCode);
  }

  @override
  Future<CupertinoLocalizations> load(Locale locale) {
    return DefaultCupertinoLocalizations.load(locale);
  }

  @override
  bool shouldReload(FallbackCupertinoLocalizationsDelegate old) => false;
}

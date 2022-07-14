

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations{
  final Locale? locale;
  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context){
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }
  // Static member to have a simple access to the delegate from the MaterialApp
  static const LocalizationsDelegate<AppLocalizations> delegate =
  _AppLocalizationsDelegate();

  Map<String,String>? _localizedString;
  Future<bool> load() async{
    String jsonString = await rootBundle.loadString('lib/src/lang/${locale!.languageCode+"-"+locale!.countryCode!}.json');

    Map<String,dynamic> jsonMap = jsonDecode(jsonString);
    _localizedString = Map<String,String>.from(jsonMap);
    print(_localizedString);
    /*_localizedString = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });*/

    return true;
  }
  String? translate(String key){
    return _localizedString![key];
  }
}

// LocalizationsDelegate is a factory for a set of localized resources
// In this case, the localized strings will be gotten in an AppLocalizations object
class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  // This delegate instance will never change (it doesn't even have fields!)
  // It can provide a constant constructor.
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return ['en', 'fr','es', 'ar','hi'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
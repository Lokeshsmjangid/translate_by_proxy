import 'package:flutter/material.dart';

class LanguageModel extends ChangeNotifier {
  Locale _locale = const Locale('en', 'US');
  final List<Locale> supportedLocales = [
    const Locale('en', 'US',),
    const Locale('es', 'ES'),
    const Locale('hi', 'IN'),
    const Locale('ur', 'PK'),
  ];

  Locale get locale => _locale;

  List<LangListData> langData = [
    LangListData(name: "English", locale: Locale('en', 'US',)),
    LangListData(name: "Spanish", locale: Locale('es', 'ES')),
    LangListData(name: "Hindi", locale: Locale('hi', 'IN')),
    LangListData(name: "Urdu", locale: const Locale('ur', 'PK'),),
  ];

  late Locale selectedLocalLang ;

   Map<String, Map<String, String>> allLocal = {
    'US': {
          'title': 'Translation Demo',
          'greeting': 'Hello, welcome to the app!',
          'switch_language': 'Switch Language',
        },
      // Spanish (Spain)
        'ES': {
          'title': 'Demostración de Traducción',
          'greeting': '¡Hola, bienvenido a la aplicación!',
          'switch_language': 'Cambiar Idioma',
        },
        // Hindi (India)
        'IN': {
          'title': 'अनुवाद डेमो',
          'greeting': 'हाय, ऐप में आपका स्वागत है!',
          'switch_language': 'भाषा बदलें',
        },
        // Urdu (Pakistan)
        'PK': {
          'title': 'ترجمہ ڈیمو',
          'greeting': 'ہیلو، ایپ میں خوش آمدید!',
          'switch_language': 'زبان تبدیل کریں',
        },
   };

    Map<String, String> selectedLocal = {}; 

  void switchLanguage(Locale langVal) {
    _locale = langVal;
    // int currentIndex = supportedLocales.indexOf(_locale);
    // int nextIndex = (currentIndex + 1) % supportedLocales.length;
    // _locale = supportedLocales[nextIndex];
    // print("Index is :: ${nextIndex}");
    print("Loacle is :: ${_locale.countryCode}");
    notifyListeners();
    //  Get.updateLocale(_locale); 
  }

  selectedLang (Locale localVal) {

    if(localVal.countryCode == "US"){
      selectedLocal = {};
      selectedLocal = allLocal['US']! ;
    }
    else if (localVal.countryCode == "ES") {
      selectedLocal = {};
      selectedLocal = allLocal['ES']! ;
    }
    else if (localVal.countryCode == "IN") {
      selectedLocal = {};
      selectedLocal = allLocal['IN']! ;
    }
    else if (localVal.countryCode == "PK") {
      selectedLocal = {};
      selectedLocal = allLocal['PK']! ;
    }

  }
}

class LangListData {
  String name;
  Locale locale;

  LangListData({this.name = "", this.locale = const Locale('en', 'US') });

}
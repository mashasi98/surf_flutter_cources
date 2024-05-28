class ResumeTexts {
  static ResumeTexts? _instance;

  ResumeTexts._();

  static ResumeTexts get instance {
    _instance ??= ResumeTexts._();
    return _instance!;
  }

  static const String name = "Maria\nNikoletta";
  static const String secondName = "Sikorskaya";
  static const String email = "mashasi98@yandex.ru";
  static const String tg = "@MariaNsi";
  static const String git = "https://github.com/mashasi98";
  static const Map<String, String> aboutMe = {'ABOUT\nME': ''};
  static const Map<String, String> hobbies = {'HOBBIES': ''};
  static const Map<String, String> education = {'': ''};
  static const Map<String, String> workExperience = {'': ''};
  static const String playerOne = 'PLayer\nOne';
  static const String moreInfo = 'MORE\nINFO';
}

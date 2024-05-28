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
  static const Map<String, String> aboutMe = {
    'ABOUT ME': 'Привет! Меня зовут Мария Николетта Анатольевна, мне 25 лет. '
        'Родилась в Венгрии, но в настоящее время живу в Краснодаре.'
        ' Могу поболтать на английском — не так хорошо, как раньше, но все же.'
        ' Воспитываю двух веселых котов. '
        'Люблю альтернативную музыку и с нетерпением жду наступления киберпанка — время,'
        ' когда технологии и человеческая натура столкнутся в эпическом симбиозе.'
  };
  static const Map<String, String> hobbies = {
    'HOBBIES': 'Очень люблю походы с палатками. '
        'Для меня это не только способ физически разгрузиться, но и возможность насладиться красотой окружающей природы.'
        'Любовь к хорошему китайскому чаю сопровождает меня в повседневной жизни, придавая ей особый шарм и умиротворение.'
        'Ну и вкусно покушать тоже очень люблю '
        'В свободное время я также занимаюсь творчеством и наслаждаюсь увлекательными настольными играми. '
  };
  static const Map<String, String> education = {
    'EDUCATION':
        'Я получила высшее образование в Кубанском государственном технологическом университете, где успешно завершила программу по специальности "Инженер строитель промышленных и гражданских сооружений". '
            'Кроме того, я прошла обучение в Высшей школе программирования по направлению "Software Engineer".'
  };
  static const Map<String, String> workExperience = {
    'WORK EXPERIENCE':
        ' Разработкой в целом я начала заниматься с 2020 года. Изучала различные области, включая Python, игровые движки и андроид-разработку на Java.\n'
            'В августе 2022 года я начала свой профессиональный путь, присоединившись к стартапу Dream Team Rocket в качестве Kotlin разработчика. За это время я приобрела ценный опыт в разработке на Kotlin. К сожалению, стартап закрылся в октябре 2022 года.\n'
            'После этого я продолжила развиваться в сфере программирования и заняла должность младшего разработчика на Java в компании S7 с марта по сентябрь 2023 года.'
  };
  static const String playerOne = 'PLayer\nOne';
  static const String moreInfo = 'MORE\nINFO';
}

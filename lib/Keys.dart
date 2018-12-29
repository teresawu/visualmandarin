import 'package:visualmandarin/model/Question.dart';

class Keys {
  static String JSON_PATH = 'data/menu.json';

  static String JSON_PATH_ANIMAL = 'data/animal.json';
  static String JSON_PATH_CAREER = 'data/career.json';
  static String JSON_PATH_COLOR = 'data/color.json';
  static String JSON_PATH_COUNTRY = 'data/country.json';
  static String JSON_PATH_DRINK = 'data/drink.json';
  static String JSON_PATH_FRUIT = 'data/fruit.json';
  static String JSON_PATH_KITCHEN = 'data/kitchen.json';
  static String JSON_PATH_PEOPLE = 'data/people.json';
  static String JSON_PATH_SPORT = 'data/sport.json';
  static String JSON_PATH_TRANSPORT = 'data/transport.json';
  static String JSON_PATH_VEGETABLE = 'data/vegetable.json';

  static String PATH_IMAGE = 'data/image/';

  static String PATH_AUDIO = 'data/audio/';

  static int DARK_GREY = 0xff515151;

  static String TITLE = "Animal";

  static Question question = Question();
  static Data data = Data();

  static String PATH = JSON_PATH_ANIMAL;

  static Map<int, String> indexMap = {
    0: JSON_PATH_ANIMAL,
    1: JSON_PATH_CAREER,
    2: JSON_PATH_COLOR,
    3: JSON_PATH_COUNTRY,
    4: JSON_PATH_DRINK,
    5: JSON_PATH_FRUIT,
    6: JSON_PATH_KITCHEN,
    7: JSON_PATH_PEOPLE,
    8: JSON_PATH_SPORT,
    9: JSON_PATH_TRANSPORT,
    10: JSON_PATH_VEGETABLE
  };
}

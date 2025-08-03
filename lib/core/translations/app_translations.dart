import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'app_title': 'ToDoList App',
        },
        'fa_IR': {
          'app_title': 'برنامه لیست کارها',
        },
      };
}

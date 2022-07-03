// ignore_for_file: file_names

import 'package:finance_mobile_app/UserProfile/Model/user.dart';

import '../../widgets/SignUp.dart';

class UserPreference {
  static var  myUser = User(
    image:
        'https://www.wallpapertip.com/wmimgs/75-754054_son-goku-ultra-instinct.png',
    name: SignUp.userName,
    email: 'goku34@gmail.com',
    about:
        'I am Goku. The strongest character in the anime universe. I want to always seek for ways to get stronger. I love to train myself always. My ultimate power is the famous "Ultra Intstinct".',
    isDarkMode: false,
  );
}

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PrefsServices {
  static final String _key = 'key';

  //Method to save user
  static save(String user) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(
      _key,
      jsonEncode(
        {
          "user": user,
          "isAuth": true,
        },
      ),
    );
  }

  //Method to verify user is authenticated
  //Return a future of a boolean
  static Future<bool> isAuth() async {
    var prefs = await SharedPreferences.getInstance();

    var jsonResult = prefs.getString(_key);
    if (jsonResult != null) {
      var mapUser = jsonDecode(jsonResult);
      return mapUser['isAuth']; //para verificar se está autenticado
    }

    return false;
  }

  //Method to logout
  static logout() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}

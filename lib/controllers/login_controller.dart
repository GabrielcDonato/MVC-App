import 'package:flutter/cupertino.dart';
import 'package:movie_app/services/prefs_service.dart';

class LoginController {
  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  String? _login;
  setLogin(String value) => _login = value;

  String? _pass;
  setPass(String value) => _pass = value;

  Future<bool> auth() async {
    inLoader.value = true;
    await Future.delayed(Duration(seconds: 2));
    inLoader.value = false;
    if (_login == "admin" && _pass == "123") {
      PrefsServices.save(_login!);
      return true;
    }
    return false;
  }
}
//A gente chama o PrefsServices que foi criado e passa a nossa variável de login como paremetro, assim salvando o usuario autenticado.
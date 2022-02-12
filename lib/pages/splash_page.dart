import 'package:flutter/material.dart';
import 'package:movie_app/services/prefs_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.wait(
      [
        PrefsServices
            .isAuth(), //primeiro index da lista por isso o 0 em value[0]
        Future.delayed(const Duration(seconds: 3)),
      ],
    ).then((value) => value[0]
        ? Navigator.of(context).pushReplacementNamed('/home')
        : Navigator.of(context).pushReplacementNamed('/login'));

    // Future.delayed(Duration(seconds: 3))
    //     .then((_) => Navigator.of(context).pushReplacementNamed('/login'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue[600],
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.cyanAccent[100],
        ),
      ),
    );
  }
}

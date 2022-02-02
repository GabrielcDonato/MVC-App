import 'package:flutter/material.dart';
import 'package:movie_app/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginController _controller = LoginController();
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(28),
        // color: Color(0xFFFFFFFF),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.people,
              size: MediaQuery.of(context).size.height * .2,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "example",
                label: Text("Login"),
              ),
              onChanged: _controller.setLogin,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "123",
                label: Text("Password "),
              ),
              obscureText: true,
              onChanged: _controller.setPass,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 25,
            ),
            ValueListenableBuilder<bool>(
              valueListenable: _controller.inLoader,
              builder: (_, inLoader, __) => inLoader
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        _controller.auth().then(
                          (result) {
                            if (result) {
                              print('sucess');
                            } else {
                              print('failed');
                            }
                          },
                        );
                      },
                      child: Text("Login"),
                    ),
            )
          ],
        ),
      ),
    );
  }
}

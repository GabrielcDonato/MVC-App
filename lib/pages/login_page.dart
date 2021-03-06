import 'package:flutter/material.dart';
import 'package:movie_app/controllers/login_controller.dart';

import '../components/login/custom_login_button_component.dart';
import '../widgets/custom_text_field_widget.dart';

class LoginPage extends StatelessWidget {
  final LoginController _controller = LoginController();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Colors.lightBlue.shade300])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.people,
              size: MediaQuery.of(context).size.height * .2,
              color: Colors.lightBlue,
            ),
            CustomTextFieldWidget(
              label: 'Login',
              hintText: 'example@example.com',
              onChanged: _controller.setLogin,
            ),
            CustomTextFieldWidget(
              label: 'Password',
              hintText: '123',
              onChanged: _controller.setPass,
              obscureText: true,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 25,
            ),
            CustomLoginButtonComponent(loginController: _controller),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(28),
        // color: Color(0xFFFFFFFF),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.people,
              size: 98,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "example",
                label: Text("Login"),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "123",
                label: Text("Password "),
              ),
              obscureText: true,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 25,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}

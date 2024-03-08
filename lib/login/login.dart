import '../fridge/fridge.dart';

import 'package:flutter/material.dart';
import 'package:testrun/login/components/login_button.dart';
import 'package:testrun/login/components/textfield.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final Fridge f = Fridge();

  final username = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(218, 210, 209, 209),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 100),
                // welcome back message
                Text('Welcome!',
                    style: TextStyle(color: Colors.grey[700], fontSize: 48)),
                // username
                const SizedBox(height: 50),
                textfield(
                  controller: username,
                  hintText: "Username",
                  obscureText: false,
                ),

                // password
                const SizedBox(height: 10),
                textfield(
                  controller: password,
                  hintText: "Password",
                  obscureText: true,
                ),

                // sign in button
                loginButton(onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Fridge()));
                }),
              ],
            ),
          ),
        ));
  }
}

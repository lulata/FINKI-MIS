import 'package:flutter/material.dart';

import '../CustomWidgets/SignInForm.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        padding: EdgeInsets.only(top: 40,bottom: 40, left: 21, right: 21),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[
              SignInForm(),
            ],
          ),
        ),
      )
    );
  }
}

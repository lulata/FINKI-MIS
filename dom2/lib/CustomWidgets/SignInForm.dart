import 'package:flutter/material.dart';
import 'package:for_testing/Components/Logo.dart';

import '../Components/InputField.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _FormExampleState();
}

class _FormExampleState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Center(
            child: Logo()
          ),
          const InputField(
            errorMessage: "Email field cannot be empty",
            isSecure: false,
            placeholder: "Email",
            pt: 20,
            pb: 12,
          ),
          const InputField(
            errorMessage: "Password field cannot be empty",
            isSecure: true,
            placeholder: "Password",
            pb: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  surfaceTintColor: Colors.white,
                  shadowColor: Colors.transparent,
                  minimumSize: const Size.fromHeight(45), // NEW
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20)),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Process data.
                }
              },
              child: const Text('Login'),
            ),
          ),
          const Center(
            child: Text("Don't have an account?"),
          ),
          Center(
            child: InkWell(
                child: const Text('Register here',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center),
                onTap: () => {}),
          )
        ],
      ),
    );
  }
}

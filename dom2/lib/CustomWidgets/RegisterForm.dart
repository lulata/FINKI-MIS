import 'package:flutter/material.dart';
import 'package:dom2/Components/Logo.dart';

import 'package:dom2/Components/InputField.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _navigateToLogin() {
    Future.delayed(Duration.zero, () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  Future<void> _authAction() async {
    try {
      // log emailController and passwordController values
      print(_emailController.text);
      print(_passwordController.text);
      await _auth.createUserWithEmailAndPassword(
        email: _emailController.value.text,
        password: _passwordController.value.text,
      );
      _showSuccessDialog(
          "Registration Successful", "You have successfully registered!");
      _navigateToLogin();
    } catch (e) {
      _showErrorDialog(
          "Authentication Error", "Error during authentication: $e");
    }
  }

  void _showSuccessDialog(String title, String message) {
    _scaffoldKey.currentState?.showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    ));
  }

  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Center(child: Logo()),
          InputField(
            errorMessage: "Email field cannot be empty",
            isSecure: false,
            placeholder: "Email",
            pt: 20,
            controller: _emailController,
            pb: 12,
          ),
          InputField(
            errorMessage: "Password field cannot be empty",
            isSecure: true,
            placeholder: "Password",
            controller: _passwordController,
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
                  _authAction();
                }
              },
              child: const Text('Register'),
            ),
          ),
          Center(
            child: InkWell(
                child: const Text('Back to login',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center),
                onTap: () => {
                      _navigateToLogin(),
                    }),
          )
        ],
      ),
    );
  }
}
